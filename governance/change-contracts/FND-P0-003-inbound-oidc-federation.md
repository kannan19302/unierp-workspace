# Change Contract — FND-P0-003 Inbound OIDC Federation

## Cycle status

- Status: `PARTIAL`
- Cycle objective: close the inbound-OIDC token, configuration-secret and activation trust boundaries while converging active SSO administration on the canonical record.
- Completed this cycle: real JOSE verification; opaque replay-safe state, nonce and S256 PKCE; SSRF-constrained discovery/JWKS preflight; authenticated secret envelopes and keyring; inactive-by-default verification lifecycle; canonical `SsoConfig` compatibility adapters; immutable migration and traceability updates.
- Incomplete this cycle: SAML replay/recipient and end-to-end connection verification, durable federation audit/outbox, DNS-rebinding-resistant production egress, authorized retirement of the legacy table, operational key-rotation exercise and security-owner sign-off.
- Verification evidence: auth 22/22 focused tests and build pass; IDP 25/25 focused tests and typecheck pass; API federation/config tests 14/14 pass, broader representative API tests 44/44 pass, security-plane and 1,790-file module-boundary gates pass. API full typecheck reaches only the previously recorded AI/extension/subscription nullability and duplicate-platform-import baseline failures; no P0-003 diagnostic remains.
- Next required action: complete SAML/e2e verification and federation audit evidence, then obtain security-owner review; production egress/rotation exercises require an authorized production-shaped environment.

| Claim | State | Evidence |
| --- | --- | --- |
| Designed | `YES` | FND-P0-003, PLT-IAM architecture, customer onboarding/IAM plan sections on opaque state and verified OIDC. |
| Implemented | `PARTIAL` | OIDC verification, configuration lifecycle, encrypted secrets and compatibility convergence are implemented; SAML/e2e and durable audit remain. |
| Tested | `PARTIAL` | Adversarial OIDC, JWKS rotation, secret tamper/rotation, lifecycle, redaction, unsafe endpoint and legacy false-success tests pass; production-shaped egress and provider exercise remain. |
| Integrated | `PARTIAL` | Active identity, administration and analytics paths consume `SsoConfig`; the unused legacy table remains pending an explicitly authorized destructive migration. |
| Deployed | `NOT VERIFIED` | No environment inspection or deployment action is in scope. |
| Released | `NOT APPLICABLE` | No release requested. |

## 1. Request and outcome

- Human request: start and complete the P0–P3 foundation plan.
- Outcome: no inbound tenant OIDC callback can issue a UniERP session unless it is bound to a one-time server-side transaction and a cryptographically verified token from the configured issuer.
- Scope: `idp` inbound OIDC flow, the shared external-auth transaction store, canonical `SsoConfig` administration contract and identity platform documentation.
- Out of scope: production mutation, live IdP credential rotation, a breaking public API change, destructive deletion of `TenantSsoConfig`, full SAML redesign, or production network/egress deployment.
- Risk class: `R3` — authentication boundary, tenant administration, session issuance and cross-repository data contract.

## 2. Authority, ownership and conflict

- Accountable platform: PLT-IAM. Tenant configuration UI belongs to PLT-TAD; `SsoConfig` is the active federation configuration consumed by PLT-IAM.
- Repositories/consumers: `idp`, `api`, `data`, `unierp-platform`, and tenant administrators configuring federation.
- Authority: identity `ARCHITECTURE.md`, `SECURITY.md`, `REQUIREMENTS.md`, `CONTRACTS.md`, `CUSTOMER_ONBOARDING_AND_IAM_PLAN.md`; security baseline `STD-SEC-001` through `STD-SEC-006`.
- Conflict: `TenantSsoConfig` and `SsoConfig` both model SSO. Active identity, both administrative compatibility surfaces and feature analytics now use `SsoConfig`; the legacy model is no longer a runtime source. Removing its table remains a separately authorized destructive data-convergence action.

## 3. Design

- State is an opaque, high-entropy, one-time server-side transaction containing tenant slug, return intent, nonce and PKCE verifier. It is consumed before code exchange.
- OIDC metadata is discovered from the canonical issuer over validated HTTPS. Discovery, authorization, token and JWKS endpoints must be HTTPS, non-local and credential-free; endpoint placement is trusted only through the issuer's metadata, with production egress policy providing the network-level SSRF boundary.
- The callback verifies the ID token via cached remote JWKS with an asymmetric algorithm allowlist, exact issuer, audience/`azp`, expiry, issued-at age and nonce. Missing/invalid claims deny before JIT provisioning or session issuance.
- All existing federation configurations are deliberately disabled by migration until an administrator supplies a standards-compliant issuer, re-saves any plaintext credential into an encrypted envelope, passes preflight and reactivates; this is a secure compatibility break.
- Administrative connection preflight proves exact discovery/JWKS reachability and compatible signing-key presence. It does not prove client credentials or a full browser callback, so production acceptance also requires an end-to-end provider exercise.
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
| Unsafe endpoint denied | tests cover HTTP, localhost/private/reserved/mapped IP, credentials, unsafe discovered endpoints and redirect denial. |
| Key rotation supported | verifier proof accepts current and retained previous JWKS keys; secret-envelope proof accepts current and retained previous encryption keys while rejecting tamper/unknown keys. |
| Existing IDP gate remains healthy | focused `vitest`, auth/data builds and IDP typecheck pass; API baseline failures are recorded separately. |

> **This is not done.** Completion requires SAML/end-to-end verification, production egress controls, durable audit/outbox work, legacy-table retirement authorization, a reviewed key-rotation exercise and security-owner sign-off.
