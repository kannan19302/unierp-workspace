# unierp-workspace

**Layer L7 — Operations** of the [UniERP](../unierp-platform) platform.
Depends on: all, at build time only.

## What this is

The release-train manifest, the shared CI gates, the local dev orchestrator and the federated ratchet.

## The invariant this repository owns

**A deploy is a manifest; a rollback is the previous manifest.** Every gate lives here as a reusable workflow — a repository declares *which* gates apply, never *how* a gate works.

## The rule that applies everywhere

A repository may depend only on published artifacts of a **strictly lower
layer** — never sideways within a layer, never upward. A cycle is not
discouraged; it is unrepresentable, because the lower layer's package cannot
name the higher one.

See the [platform overview](../unierp-platform/README.md) for the full map, and
[`PLATFORM_ARCHITECTURE.md`](../ERPSys/docs/PLATFORM_ARCHITECTURE.md) § 4.2 for
the reasoning.

## Licence

AGPL-3.0.
