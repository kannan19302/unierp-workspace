# Change Contract — FND-P0-003 Inbound OIDC Federation

## Cycle status

- Status: `PARTIAL`
- Cycle objective: remove the unsigned inbound-OIDC token acceptance path and make the live federation flow use one-time opaque state, PKCE, OIDC discovery, JWKS signature verification and explicit token-claim checks.
- Completed this cycle: authority, implementation, schema ownership and existing test evidence inspected; implementation is in progress.
- Incomplete this cycle: verified-domain policy, federation configuration lifecycle, SAML replay/recipient validation, encryption/key-management, durable federation audit, operational key-rotation exercise and production egress controls.
- Verification evidence: `pnpm exec vitest run src/modules/auth/tests/sso.service.security.spec.ts --pool=forks --poolOptions.forks.minForks=1 --poolOptions.forks.maxForks=1 --reporter=verbose` passed 5/5; `pnpm typecheck` passed in `idp` and `api`.
- Next required action: update the canonical identity requirements/contracts, implement the fail-closed OIDC flow and add adversarial proof.

| Claim | State | Evidence |
| --- | --- | --- |
| Designed | `YES` | FND-P0-003, PLT-IAM architecture, customer onboarding/IAM plan sections on opaque state and verified OIDC. |
| Implemented | `PARTIAL` | The existing callback exchanges a code but parses the `id_token` payload without verification. |
| Tested | `PARTIAL` | Controller plumbing tests exist; identity-token forgery, issuer, audience, nonce and replay proof is absent. |
| Integrated | `PARTIAL` | `idp` consumes canonical `SsoConfig`; the separate `TenantSsoConfig` model remains a duplicate and is not trusted by this flow. |
| Deployed | `NOT VERIFIED` | No environment inspection or deployment action is in scope. |
| Released | `NOT APPLICABLE` | No release requested. |

## 1. Request and outcome

- Human request: start and complete the P0–P3 foundation plan.
- Outcome: no inbound tenant OIDC callback can issue a UniERP session unless it is bound to a one-time server-side transaction and a cryptographically verified token from the configured issuer.
- Scope: `idp` inbound OIDC flow, the shared external-auth transaction store, canonical `SsoConfig` administration contract and identity platform documentation.
- Out of scope: production mutation, IdP credential rotation, a breaking public API change, migrating or deleting `TenantSsoConfig`, SAML redesign, or a production network/egress deployment.
- Risk class: `R3` — authentication boundary, tenant administration, session issuance and cross-repository data contract.

## 2. Authority, ownership and conflict

- Accountable platform: PLT-IAM. Tenant configuration UI belongs to PLT-TAD; `SsoConfig` is the active federation configuration consumed by PLT-IAM.
- Repositories/consumers: `idp`, `api`, `data`, `unierp-platform`, and tenant administrators configuring federation.
- Authority: identity `ARCHITECTURE.md`, `SECURITY.md`, `REQUIREMENTS.md`, `CONTRACTS.md`, `CUSTOMER_ONBOARDING_AND_IAM_PLAN.md`; security baseline `STD-SEC-001` through `STD-SEC-006`.
- Conflict: `TenantSsoConfig` and `SsoConfig` both model SSO. The active IDP flow and tenant-security portal use `SsoConfig`; the other model is neither an authorization source nor a trusted federation input. It must be retired or migrated under a separately approved data-convergence item.

## 3. Design

- State is an opaque, high-entropy, one-time server-side transaction containing tenant slug, return intent, nonce and PKCE verifier. It is consumed before code exchange.
- OIDC metadata is discovered from the canonical issuer over validated HTTPS. Discovery, authorization, token and JWKS endpoints must be HTTPS, non-local and credential-free; endpoint placement is trusted only through the issuer's metadata, with production egress policy providing the network-level SSRF boundary.
- The callback verifies the ID token via cached remote JWKS with an asymmetric algorithm allowlist, exact issuer, audience/`azp`, expiry, issued-at age and nonce. Missing/invalid claims deny before JIT provisioning or session issuance.
- Existing federation configurations without an issuer are deliberately disabled at runtime until an administrator supplies a standards-compliant issuer; this is a secure compatibility break.
- No secret, token, authorization code, email or raw upstream response is emitted in logs or audit data.

## 4. Security, tenancy and operations

- Tenant scope: state binds one tenant slug and cannot be replayed against another callback route.
- Authorization: only the existing tenant-admin security route may persist the canonical config; authentication callback is public but fail-closed.
- Failure: invalid state, discovery, endpoints, code exchange, signature, claims or upstream response return a generic unauthorized response. Discovery/key failures receive a correlation-safe server log without raw tokens.
- SSRF: code rejects insecure/local/credentialed endpoints and requires same-origin discovery metadata. Production still requires an outbound egress policy that blocks private/link-local and metadata services; that deployment proof remains incomplete.
- Compatibility: no public callback route changes. Existing OIDC records lacking an issuer are no longer usable until corrected.
- Rollback: revert code/doc/schema changes only; no migration is destructive. The security break must not be bypassed by rollback in a deployed environment without owner approval.

## 5. Verification plan

| Claim | Proof |
| --- | --- |
| Forged/wrong issuer/audience token denied | focused service tests assert `jwtVerify` settings and session is never minted. |
| Nonce mismatch/replay/cross-tenant state denied | focused service tests consume the opaque state once and reject mismatches. |
| PKCE binding | authorization URL contains S256 challenge and exchange sends stored verifier. |
| Unsafe endpoint denied | tests cover HTTP, localhost/private IP, credentials and cross-origin discovery endpoint rejection. |
| Key rotation supported | cached remote JWKS is used by `jose` and test proves the verifier is constructed from discovered JWKS rather than a hard-coded key. |
| Existing IDP gate remains healthy | focused `vitest` and `pnpm typecheck` run; broader test/build status recorded honestly. |

> **This is not done.** Completion requires verified-domain and configuration-lifecycle controls, production egress controls, durable audit/outbox work and a reviewed key-rotation exercise in addition to this code slice.
