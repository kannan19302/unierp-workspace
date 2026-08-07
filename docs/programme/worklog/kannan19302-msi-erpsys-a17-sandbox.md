# Journal — kannan19302@MSI/ERPSys-a17-sandbox

> Written by `scripts/start.mjs`. Do not hand-edit. Newest block last.
> Protocol: [`../WORKLOG.md`](../WORKLOG.md). Aggregate view:
> `node scripts/start.mjs --who`

### A17 · CLAIMED · 2026-08-07T23:40:21Z · kannan19302@MSI/ERPSys-a17-sandbox

```
wave      0
branch    autopilot/a17-sandbox
selected  explicitly requested
Work has NOT started. This block exists so no other agent takes this phase.
```

### A17 · FINISH · 2026-08-07T23:57:45Z · kannan19302@MSI/ERPSys-a17-sandbox

```
verify.mjs: PASS

A17 - Sandbox hardening - exit-criterion evidence
=================================================
Repo:      D:\UniERP\unierp-sandbox
Command:   npm run test:hardening     (npm script = vitest run src/hardening.spec.ts)
Criterion: "Each A16 threat has a mitigation and a test. process, require, fs, net
           are provably unreachable from inside the isolate."

The hardening suite is written test-first (src/hardening.spec.ts, 44 tests):
  - 5 tests prove process / require / fs / net are unreachable from inside the isolate,
  - one behavioural test per A16 threat T11..T19,
  - a coverage suite asserting each T01..T19 appears as a mitigation marker in the
    source and as a test marker in the specs.

--------------------------------------------------------------------------
1) BEFORE BUILD - suite run against the unhardened code (T11..T19 unmitigated)
--------------------------------------------------------------------------
   Test Files  1 failed (1)
        Tests  38 failed | 6 passed (44)
   (6 passed are the hard-requirement isolation tests that already held;
    38 fail because the mitigations did not exist. Representative failures:
      T14  -> expected 416.0589 to be less than 200        (wall clock billed as CPU)
      T15  -> expected true to be false                    (breaker reused the kill switch)
      T18  -> Unexpected token 'E', "EVIL" is not valid JSON (host parsed poisoned string)
      T11/T17/T13/T19 -> promise resolved instead of rejecting)

--------------------------------------------------------------------------
2) AFTER BUILD - exit criterion PASSES
--------------------------------------------------------------------------

 RUN  v2.1.9 D:/UniERP/unierp-sandbox

 Γ£ô src/hardening.spec.ts (44 tests) 3212ms
   Γ£ô A17 hardening ΓÇö T14 CPU is real CPU, not wall clock > T14 ΓÇö time spent waiting on a slow host callback is not billed as CPU 406ms
   Γ£ô A17 hardening ΓÇö T15 breaker is separate from the kill switch and recovers > T15 ΓÇö an automatic CPU trip is not the operator kill switch, and clears when the window rolls over 2415ms
   Γ£ô A17 hardening ΓÇö T19 concurrent isolates are capped > T19 ΓÇö a second concurrent invocation for the same tenant is rejected at the cap 303ms

 Test Files  1 passed (1)
      Tests  44 passed (44)
   Start at  05:27:21
   Duration  3.82s (transform 96ms, setup 0ms, collect 146ms, tests 3.21s, environment 0ms, prepare 156ms)




--------------------------------------------------------------------------
3) DELIBERATE BREAK - the T11 bridge byte-budget cap was disabled
   (if (false && byteLength(argsJson) > hardening.bridgeBytes)) and the
   suite re-run. The exit criterion FAILS as expected.
--------------------------------------------------------------------------

> @unerp/sandbox@1.0.4 test:hardening
> vitest run src/hardening.spec.ts


[1m[7m[36m RUN [39m[27m[22m [36mv2.1.9 [39m[90mD:/UniERP/unierp-sandbox[39m

 [31mΓ¥»[39m src/hardening.spec.ts [2m([22m[2m44 tests[22m[2m | [22m[31m1 failed[39m[2m)[22m[33m 3219[2mms[22m[39m
[31m   [31m├ù[31m A17 hardening ΓÇö T11 bridge byte budget[2m > [22mT11 ΓÇö caps the serialised payload the isolate hands to the host, before the host parses it[90m 12[2mms[22m[31m[39m
[31m     ΓåÆ promise resolved "{ result: 1, usage: { ΓÇª(4) } }" instead of rejecting[39m
   [33m[2mΓ£ô[22m[39m A17 hardening ΓÇö T14 CPU is real CPU, not wall clock[2m > [22mT14 ΓÇö time spent waiting on a slow host callback is not billed as CPU [33m410[2mms[22m[39m
   [33m[2mΓ£ô[22m[39m A17 hardening ΓÇö T15 breaker is separate from the kill switch and recovers[2m > [22mT15 ΓÇö an automatic CPU trip is not the operator kill switch, and clears when the window rolls over [33m2415[2mms[22m[39m
   [33m[2mΓ£ô[22m[39m A17 hardening ΓÇö T19 concurrent isolates are capped[2m > [22mT19 ΓÇö a second concurrent invocation for the same tenant is rejected at the cap [33m303[2mms[22m[39m

node.exe : [31mΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»[1m[7m Failed Tests 1 [27m[22mΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»[39m
At line:1 char:1
+ & "C:\Program Files\nodejs/node.exe" "C:\Program Files\nodejs/node_mo ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: ([31mΓÄ»ΓÄ»ΓÄ»Γ...»ΓÄ»ΓÄ»ΓÄ»[39m:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 

[31m[1m[7m FAIL [27m[22m[39m src/hardening.spec.ts[2m > [22mA17 hardening ΓÇö T11 bridge byte budget[2m > 
[22mT11 ΓÇö caps the serialised payload the isolate hands to the host, before the host parses it
[31m[1mAssertionError[22m: promise resolved "{ result: 1, usage: { ΓÇª(4) } }" instead of rejecting[39m

[32m- Expected[39m
[31m+ Received[39m

[32m- [Error: rejected promise][39m
[31m+ Object {[39m
[31m+   "result": 1,[39m
[31m+   "usage": Object {[39m
[31m+     "cpuMs": 1.0389,[39m
[31m+     "httpCalls": 0,[39m
[31m+     "queries": 1,[39m
[31m+     "rows": 1,[39m
[31m+   },[39m
[31m+ }[39m

[36m [2mΓ¥»[22m src/hardening.spec.ts:[2m120:5[22m[39m
    [90m118| [39m        { hook[33m:[39m [32m"go"[39m }[33m,[39m
    [90m119| [39m      )[33m,[39m
    [90m120| [39m    )[33m.[39mrejects[33m.[39m[34mtoThrow[39m([36m/budget/i[39m)[33m;[39m
    [90m   | [39m    [31m^[39m
    [90m121| [39m    
[34mexpect[39m(host[33m.[39mdataWrite)[33m.[39mnot[33m.[39m[34mtoHaveBeenCalled[39m()[33m;[39m
    [90m122| [39m  })[33m;[39m

[31m[2mΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»ΓÄ»[1/1]ΓÄ»[22m[39m

[2m Test Files [22m [1m[31m1 failed[39m[22m[90m (1)[39m
[2m      Tests [22m [1m[31m1 failed[39m[22m[2m | [22m[1m[32m43 passed[39m[22m[90m (44)[39m
[2m   Start at [22m 05:24:57
[2m   Duration [22m 3.86s[2m (transform 87ms, setup 0ms, collect 134ms, tests 3.22s, environment 0ms, prepare 169ms)[22m
```

