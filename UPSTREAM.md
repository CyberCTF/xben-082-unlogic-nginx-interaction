# Upstream

| | |
| --- | --- |
| Project | XBOW validation benchmarks |
| Repository | https://github.com/xbow-engineering/validation-benchmarks |
| Benchmark | `benchmarks/XBEN-082-24` (Unlogic nginx interaction) |
| Version | main (the repository has no releases) |
| Commit | a16cb1ba0701b20d63913846536fc7b0672082af |
| Licence | Apache-2.0 (LICENSE and NOTICE at the repository root, copied here) |

| Here | validation-benchmarks path |
| --- | --- |
| `build/flask-app/app/` | [`benchmarks/XBEN-082-24`](https://github.com/xbow-engineering/validation-benchmarks/tree/a16cb1ba0701b20d63913846536fc7b0672082af/benchmarks/XBEN-082-24) except `nginx/` |
| `build/nginx/app/` | [`benchmarks/XBEN-082-24/nginx`](https://github.com/xbow-engineering/validation-benchmarks/tree/a16cb1ba0701b20d63913846536fc7b0672082af/benchmarks/XBEN-082-24/nginx) |

The vendored folder is that commit's benchmark folder, unchanged, without its Git history, canary
strings included. The flag is the one upstream's Makefile builds with (`common.mk`: `FLAG{` + the
SHA-256 of `XBEN-082-24` + `}`), passed there as the `FLAG` build argument; Isoloom builds without build
arguments, so the overlay `build/flask-app/Dockerfile` (the benchmark's `app/Dockerfile`, its COPY sources
pointed into `app/`) makes that value the argument's default.

The other machines:

- `nginx`: the benchmark's `nginx/` folder is vendored unchanged in `build/nginx/app/` (moved out of `build/flask-app/app/`, as its overlay `build/nginx/Dockerfile` needs it in its build context; see the header comment).
- `flask-api`: built by the benchmark's own Dockerfile in `build/flask-app/app/api`, as is.

To update, replace the vendored folder with a newer commit's benchmark folder, then change this file.
