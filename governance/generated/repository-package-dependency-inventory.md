# Repository, package and dependency inventory

Generated artifact — do not edit by hand.  
Sources: `UniERP.code-workspace`, `unierp-workspace/governance/active-estate.json`, active `package.json` manifests and repository Git heads.  
Command: `node scripts/generate-repository-inventory.mjs` from `unierp-workspace`.  
Freshness check: `node scripts/generate-repository-inventory.mjs --check`.

Summary: 31 active repositories, 28 package identities and 61 internal dependency declarations. Upward edges: 0. Cycles: 0.

## Active repositories and toolchains

| Repository | Layer | Package identity | Git head | Package manager | Node engine | Lock |
| --- | ---: | --- | --- | --- | --- | --- |
| unierp-contracts | L0 | @kannan19302/contracts | 9aff2649e8e5 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| auth | L1 | @kannan19302/auth | 47aab38b5d26 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| config | L1 | @kannan19302/config | 3dec7db7f156 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| design-system | L1 | @kannan19302/ui | 701f46ece625 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| kernel | L1 | @kannan19302/kernel | 30853b829777 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| sdk | L1 | @kannan19302/sdk | 4de37a896a81 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| service-kit | L1 | @kannan19302/service-kit | 22a4549f3702 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| shared | L1 | @kannan19302/shared | 7e98e40ee709 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| storybook | L1 | @kannan19302/storybook | 78018872dac3 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| blockchain | L2 | @kannan19302/blockchain | 85965c838d90 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| data | L2 | @kannan19302/database | 1ba98220a220 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| extension-api | L2 | @kannan19302/extension-api | 9d95ab8cd1aa | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| framework | L2 | @kannan19302/framework | 13adfd02d4d3 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| sandbox | L2 | @kannan19302/sandbox | 32e1369ddfd5 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| api | L3 | @kannan19302/api | 270e35de3db0 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| idp | L3 | @kannan19302/idp | 82bb8ff96a26 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| developer-platform | L4 | @kannan19302/developer | af8284a463f6 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| marketing-site | L4 | unierp-corporate-website | 0c463c413a7b | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| marketplace | L4 | @kannan19302/marketplace | 0bb3867ae592 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| provider-admin-os | L4 | @kannan19302/console | f6d58dbc6d99 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| tenant-admin | L4 | @kannan19302/tenant-admin | 0f0180e5a70b | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| tenant-apps | L4 | @kannan19302/web | c4e496fe466c | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| tenant-site-template | L4 | @kannan19302/corporate-site-template | 27cdf0bbf15e | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| tenant-sites | L4 | @kannan19302/tenant-sites | 7d2f21b91c20 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| web-studio | L4 | @kannan19302/web-studio | e67238485a08 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| desktop-app | L5 | @kannan19302/desktop | 3bf21bc84b5c | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| unierp-mobile | L5 | — | d60456c8d196 | — | — | — |
| extensions | L6 | unierp-extensions | 7bc769841735 | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| infra | L7 | — | e12689b9d16d | — | — | — |
| unierp-workspace | L7 | unierp-programme | 9656aa2d6fad | pnpm@9.15.4 | >=22 <23 | pnpm-lock.yaml |
| unierp-platform | — | — | 9c27bbd9568c | — | — | — |

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

