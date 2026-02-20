<h1 align="center">
CoreMath
</h1>

CoreMath.jl is a Julia package wrapping the [CORE-MATH](https://core-math.gitlabpages.inria.fr/) functions. This project provides **correctly-rounded** mathematical functions.

See also: [CRlibm.jl](https://github.com/JuliaIntervals/CRlibm.jl).

### What is correct rounding?

Suppose that we ask Julia to calculate the cosine of a number

```julia
julia> cos(0.5) # Julia build-in `cos` function
0.8775825618903728
```

The result is a floating-point number that is a very good approximation to the true value. However, we do not know if the result that Julia gives is below or above the true value, nor how far away it is.

Correctly-rounded functions guarantee that when the result is not exactly representable as a floating-point number, the value returned is the **next largest floating-point number when rounding up**, or **the next smallest when rounding down**. This is equivalent to doing the calculation in infinite precision and then performing the rounding.

### List of implemented functions

All functions from CORE-MATH are wrapped:
- exponential: `cr_cbrt` (`Float16` and `Float32`), `cr_cbrt`, `cr_pow`, `cr_exp`, `cr_exp2`, `cr_exp10`, `cr_expm1`, `cr_exp2m1`, `cr_exp10m1`
- logarithmic: `cr_log`, `cr_log2`, `cr_log10`, `cr_log1p`, `cr_log2p1`, `cr_log10p1`
- trigonometric: `cr_sin`, `cr_cos`, `cr_tan`, `cr_asin`, `cr_acos`, `cr_atan`, `cr_atan2`, `cr_sinpi`, `cr_cospi`, `cr_tanpi`, `cr_asinpi`, `cr_acospi`, `cr_atanpi`, `cr_atan2pi`
- hyperbolic: `cr_sinh`, `cr_cosh`, `cr_tanh`, `cr_asinh`, `cr_acosh`, `cr_atanh`
- others: `cr_hypot`, `cr_rsqrt`, `cr_erf`, `cr_erfc`, `cr_lgamma`, `cr_tgamma`

## Installation

The CoreMath.jl package requires to [install Julia](https://julialang.org/downloads/) (v1.6 or above).

Then, start Julia and execute the following command in the REPL:

```julia
using Pkg; Pkg.add("CoreMath")
```

## Usage

All functions use the `cr_` prefix, and are used as follows:

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

## Precision support

| Type | Platforms | C suffix |
|------|-----------|----------|
| `Float64` | All | (none) |
| `Float32` | All | `f` |
| `Float16` | Linux only | `f16` |

Float16 requires GCC 12+ for `_Float16` support and is not available on macOS, FreeBSD, or Windows.
