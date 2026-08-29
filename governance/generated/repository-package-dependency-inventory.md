# Repository, package and dependency inventory

Generated artifact — do not edit by hand.  
Sources: `UniERP.code-workspace`, `unierp-workspace/governance/active-estate.json`, active `package.json` manifests and repository Git heads.  
Command: `node scripts/generate-repository-inventory.mjs` from `unierp-workspace`.  
Freshness check: `node scripts/generate-repository-inventory.mjs --check`.

Summary: 31 active repositories, 28 package identities and 61 internal dependency declarations. Upward edges: 0. Cycles: 0.

## Active repositories and toolchains

| Repository | Layer | Package identity | Git head | Package manager | Node engine | Lock |
| --- | ---: | --- | --- | --- | --- | --- |
| unierp-contracts | L0 | @kannan19302/contracts | a88301541829 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| auth | L1 | @kannan19302/auth | 0c4070e35be7 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| config | L1 | @kannan19302/config | 417d3b4b3a58 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| design-system | L1 | @kannan19302/ui | f96aa6af46ab | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| kernel | L1 | @kannan19302/kernel | 4c8c594910d4 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| sdk | L1 | @kannan19302/sdk | d2c1c9fc1b2e | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| service-kit | L1 | @kannan19302/service-kit | 2713e97cad79 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| shared | L1 | @kannan19302/shared | 90ac38bf4a12 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| storybook | L1 | @kannan19302/storybook | e6ba68f53e22 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| blockchain | L2 | @kannan19302/blockchain | e4f21c069831 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| data | L2 | @kannan19302/database | 96520fe1f8fa | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| extension-api | L2 | @kannan19302/extension-api | 96e6fb433e4f | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| framework | L2 | @kannan19302/framework | a6abebfcd783 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| sandbox | L2 | @kannan19302/sandbox | d3e427475013 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| api | L3 | @kannan19302/api | 2e64475ecee8 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| idp | L3 | @kannan19302/idp | eb961129cbb2 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| developer-platform | L4 | @kannan19302/developer | 2162529a89d0 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| marketing-site | L4 | unierp-corporate-website | ebe2bb39e320 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| marketplace | L4 | @kannan19302/marketplace | c0f3ff89102e | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| provider-admin-os | L4 | @kannan19302/console | 5b64f5f33ca8 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| tenant-admin | L4 | @kannan19302/tenant-admin | e0244191dcfb | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| tenant-apps | L4 | @kannan19302/web | a3d02170bd21 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| tenant-site-template | L4 | @kannan19302/corporate-site-template | a15b13bc9b64 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| tenant-sites | L4 | @kannan19302/tenant-sites | 427a5e01e2c3 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| web-studio | L4 | @kannan19302/web-studio | ea0f6d9f9528 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| desktop-app | L5 | @kannan19302/desktop | 975b46d40b4a | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| unierp-mobile | L5 | — | c872b9dd7dc6 | — | — | — |
| extensions | L6 | unierp-extensions | 009eb7333f49 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| infra | L7 | — | 07d710c71c73 | — | — | — |
| unierp-workspace | L7 | unierp-programme | 0bb9682d45d5 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| unierp-platform | — | — | 956a65b4f665 | — | — | — |

## Internal package dependencies

| From | Layer | To | Layer | Package | Section | Declared range |
| --- | ---: | --- | ---: | --- | --- | --- |
| api | L3 | auth | L1 | @kannan19302/auth | dependencies | file:../auth |
| api | L3 | blockchain | L2 | @kannan19302/blockchain | dependencies | ^1.0.3 |
| api | L3 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| api | L3 | data | L2 | @kannan19302/database | dependencies | file:../data |
| api | L3 | extension-api | L2 | @kannan19302/extension-api | dependencies | ^1.0.6 |
| api | L3 | sandbox | L2 | @kannan19302/sandbox | dependencies | ^1.0.4 |
| api | L3 | service-kit | L1 | @kannan19302/service-kit | dependencies | ^0.2.3 |
| api | L3 | shared | L1 | @kannan19302/shared | dependencies | file:../shared |
| api | L3 | unierp-contracts | L0 | @kannan19302/contracts | dependencies | file:..\unierp-contracts |
| auth | L1 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| auth | L1 | shared | L1 | @kannan19302/shared | dependencies | file:../shared |
| blockchain | L2 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| blockchain | L2 | shared | L1 | @kannan19302/shared | peerDependencies | ^1.0.5 |
| data | L2 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| data | L2 | shared | L1 | @kannan19302/shared | devDependencies | file:../shared |
| design-system | L1 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| developer-platform | L4 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| developer-platform | L4 | design-system | L1 | @kannan19302/ui | dependencies | ^1.0.15 |
| developer-platform | L4 | framework | L2 | @kannan19302/framework | dependencies | ^0.1.4 |
| developer-platform | L4 | sdk | L1 | @kannan19302/sdk | dependencies | ^1.0.3 |
| developer-platform | L4 | shared | L1 | @kannan19302/shared | dependencies | ^1.0.5 |
| framework | L2 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| framework | L2 | design-system | L1 | @kannan19302/ui | dependencies | ^1.0.15 |
| idp | L3 | auth | L1 | @kannan19302/auth | dependencies | file:../auth |
| idp | L3 | blockchain | L2 | @kannan19302/blockchain | dependencies | ^1.0.3 |
| idp | L3 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| idp | L3 | data | L2 | @kannan19302/database | dependencies | file:../data |
| idp | L3 | service-kit | L1 | @kannan19302/service-kit | dependencies | ^0.2.3 |
| idp | L3 | shared | L1 | @kannan19302/shared | dependencies | file:../shared |
| kernel | L1 | unierp-contracts | L0 | @kannan19302/contracts | dependencies | ^1.0.4 |
| marketing-site | L4 | design-system | L1 | @kannan19302/ui | dependencies | ^1.0.15 |
| marketplace | L4 | auth | L1 | @kannan19302/auth | dependencies | ^1.0.4 |
| marketplace | L4 | design-system | L1 | @kannan19302/ui | dependencies | ^1.0.15 |
| marketplace | L4 | framework | L2 | @kannan19302/framework | dependencies | ^0.1.4 |
| marketplace | L4 | sdk | L1 | @kannan19302/sdk | dependencies | ^1.0.3 |
| provider-admin-os | L4 | auth | L1 | @kannan19302/auth | dependencies | ^1.0.4 |
| provider-admin-os | L4 | design-system | L1 | @kannan19302/ui | dependencies | file:../design-system |
| provider-admin-os | L4 | framework | L2 | @kannan19302/framework | dependencies | ^0.1.4 |
| provider-admin-os | L4 | sdk | L1 | @kannan19302/sdk | dependencies | ^1.0.3 |
| provider-admin-os | L4 | shared | L1 | @kannan19302/shared | dependencies | file:../shared |
| sandbox | L2 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| sandbox | L2 | extension-api | L2 | @kannan19302/extension-api | dependencies | ^1.0.6 |
| sdk | L1 | unierp-contracts | L0 | @kannan19302/contracts | dependencies | ^1.0.4 |
| shared | L1 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| shared | L1 | unierp-contracts | L0 | @kannan19302/contracts | dependencies | file:../unierp-contracts |
| storybook | L1 | config | L1 | @kannan19302/config | devDependencies | 1.0.2 |
| storybook | L1 | design-system | L1 | @kannan19302/ui | dependencies | 1.0.15 |
| tenant-admin | L4 | auth | L1 | @kannan19302/auth | dependencies | ^1.0.4 |
| tenant-admin | L4 | design-system | L1 | @kannan19302/ui | dependencies | ^1.0.15 |
| tenant-admin | L4 | framework | L2 | @kannan19302/framework | dependencies | ^0.1.4 |
| tenant-admin | L4 | sdk | L1 | @kannan19302/sdk | dependencies | ^1.0.3 |
| tenant-apps | L4 | auth | L1 | @kannan19302/auth | dependencies | ^1.0.3 |
| tenant-apps | L4 | config | L1 | @kannan19302/config | devDependencies | ^1.0.2 |
| tenant-apps | L4 | design-system | L1 | @kannan19302/ui | dependencies | ^1.0.15 |
| tenant-apps | L4 | framework | L2 | @kannan19302/framework | dependencies | ^0.1.4 |
| tenant-apps | L4 | sdk | L1 | @kannan19302/sdk | dependencies | ^1.0.3 |
| tenant-apps | L4 | shared | L1 | @kannan19302/shared | dependencies | ^1.0.5 |
| tenant-sites | L4 | auth | L1 | @kannan19302/auth | dependencies | ^1.0.4 |
| tenant-sites | L4 | design-system | L1 | @kannan19302/ui | dependencies | ^1.0.15 |
| tenant-sites | L4 | framework | L2 | @kannan19302/framework | dependencies | ^0.1.4 |
| tenant-sites | L4 | sdk | L1 | @kannan19302/sdk | dependencies | ^1.0.3 |

## Interpretation

This inventory proves only declared repository/package topology at the recorded Git heads. It does not prove runtime integration, contract compatibility, release publication or production deployment.

