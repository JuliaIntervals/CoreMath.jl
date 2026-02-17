# CoreMath.jl

Julia wrappers for the [core-math](https://core-math.gitlabpages.inria.fr/) library, which provides **correctly-rounded** IEEE 754 math functions.

Unlike `Base` math functions (which are *faithfully* rounded, i.e. off by at most 1 ULP), CoreMath guarantees that every result is the nearest representable floating-point number to the exact mathematical value.

## Installation

```julia
using Pkg
Pkg.add("CoreMath")
```

## Usage

All functions use the `cr_` prefix to distinguish them from `Base` equivalents:

```julia
using CoreMath

# Float64
cr_sin(1.0)          # 0.8414709848078965
cr_exp(1.0)          # 2.718281828459045
cr_log(2.0)          # 0.6931471805599453
cr_cbrt(27.0)        # 3.0

# Float32 — same function names, dispatch on type
cr_sin(1.0f0)        # 0.84147096f0
cr_exp(1.0f0)        # 2.7182817f0

# Float16 (Linux only)
cr_sin(Float16(1.0)) # Float16(0.8413)
cr_exp(Float16(1.0)) # Float16(2.719)
```

### Bivariate functions

```julia
cr_pow(2.0, 10.0)    # 1024.0
cr_hypot(3.0, 4.0)   # 5.0
cr_atan2(1.0, 1.0)   # 0.7853981633974483
```

### sincos

```julia
s, c = cr_sincos(1.0)  # (0.8414709848078965, 0.5403023058681398)
```

## Available functions

**Trigonometric:** `cr_sin`, `cr_cos`, `cr_tan`, `cr_asin`, `cr_acos`, `cr_atan`

**Pi-scaled trigonometric:** `cr_sinpi`, `cr_cospi`, `cr_tanpi`, `cr_asinpi`, `cr_acospi`, `cr_atanpi`

**Hyperbolic:** `cr_sinh`, `cr_cosh`, `cr_tanh`, `cr_asinh`, `cr_acosh`, `cr_atanh`

**Exponential:** `cr_exp`, `cr_exp2`, `cr_exp10`, `cr_expm1`, `cr_exp2m1`, `cr_exp10m1`

**Logarithmic:** `cr_log`, `cr_log2`, `cr_log10`, `cr_log1p`, `cr_log2p1`, `cr_log10p1`

**Other:** `cr_cbrt`, `cr_rsqrt`, `cr_erf`, `cr_erfc`, `cr_lgamma`, `cr_tgamma`

**Bivariate:** `cr_pow`, `cr_hypot`, `cr_atan2`, `cr_atan2pi`

**Special:** `cr_sincos`

## Precision support

| Type | Platforms | C suffix |
|------|-----------|----------|
| `Float64` | All | (none) |
| `Float32` | All | `f` |
| `Float16` | Linux only | `f16` |

Float16 requires GCC 12+ for `_Float16` support and is not available on macOS, FreeBSD, or Windows.

## See also

- [core-math project](https://core-math.gitlabpages.inria.fr/) — the upstream C library
- [CRlibm.jl](https://github.com/JuliaIntervals/CRlibm.jl) — an earlier correctly-rounded math library for Julia (fewer functions, no Float32/Float16)
