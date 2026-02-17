module CoreMath

using CoreMath_jll

# Univariate functions shared by Float64, Float32, and Float16
const univariate_functions = (
    :acos, :asin, :atan, :cos, :sin, :tan,
    :acospi, :asinpi, :atanpi, :cospi, :sinpi, :tanpi,
    :acosh, :asinh, :atanh, :cosh, :sinh, :tanh,
    :exp, :exp2, :exp10, :expm1, :exp2m1, :exp10m1,
    :log, :log2, :log10, :log1p, :log2p1, :log10p1,
    :cbrt, :rsqrt,
    :erf, :erfc, :lgamma, :tgamma,
)

# Float64 univariate: double cr_{name}(double x)
for f in univariate_functions
    cr_name = Symbol("cr_", f)
    @eval begin
        function $cr_name(x::Float64)
            ccall(
                ($(QuoteNode(cr_name)), libcoremath),
                Float64,
                (Float64,),
                x,
            )
        end
        export $cr_name
    end
end

# Float32 univariate: float cr_{name}f(float x)
for f in univariate_functions
    cr_name = Symbol("cr_", f)
    c_name = Symbol("cr_", f, "f")
    @eval begin
        function $cr_name(x::Float32)
            ccall(
                ($(QuoteNode(c_name)), libcoremath),
                Float32,
                (Float32,),
                x,
            )
        end
    end
end

# Float16 univariate: _Float16 cr_{name}f16(_Float16 x)
for f in univariate_functions
    cr_name = Symbol("cr_", f)
    c_name = Symbol("cr_", f, "f16")
    @eval begin
        function $cr_name(x::Float16)
            ccall(
                ($(QuoteNode(c_name)), libcoremath),
                Float16,
                (Float16,),
                x,
            )
        end
    end
end

# Bivariate functions shared by Float64, Float32, and Float16
const bivariate_functions = (:pow, :hypot, :atan2, :atan2pi)

# Float64 bivariate: double cr_{name}(double x, double y)
for f in bivariate_functions
    cr_name = Symbol("cr_", f)
    @eval begin
        function $cr_name(x::Float64, y::Float64)
            ccall(
                ($(QuoteNode(cr_name)), libcoremath),
                Float64,
                (Float64, Float64),
                x, y,
            )
        end
        export $cr_name
    end
end

# Float32 bivariate: float cr_{name}f(float x, float y)
for f in bivariate_functions
    cr_name = Symbol("cr_", f)
    c_name = Symbol("cr_", f, "f")
    @eval begin
        function $cr_name(x::Float32, y::Float32)
            ccall(
                ($(QuoteNode(c_name)), libcoremath),
                Float32,
                (Float32, Float32),
                x, y,
            )
        end
    end
end

# Float16 bivariate: _Float16 cr_{name}f16(_Float16 x, _Float16 y)
for f in bivariate_functions
    cr_name = Symbol("cr_", f)
    c_name = Symbol("cr_", f, "f16")
    @eval begin
        function $cr_name(x::Float16, y::Float16)
            ccall(
                ($(QuoteNode(c_name)), libcoremath),
                Float16,
                (Float16, Float16),
                x, y,
            )
        end
    end
end

# Float64: void cr_sincos(double x, double *sinp, double *cosp)
function cr_sincos(x::Float64)
    s = Ref{Float64}()
    c = Ref{Float64}()
    ccall(
        (:cr_sincos, libcoremath),
        Cvoid,
        (Float64, Ref{Float64}, Ref{Float64}),
        x, s, c,
    )
    return (s[], c[])
end

# Float32: void cr_sincosf(float x, float *sinp, float *cosp)
function cr_sincos(x::Float32)
    s = Ref{Float32}()
    c = Ref{Float32}()
    ccall(
        (:cr_sincosf, libcoremath),
        Cvoid,
        (Float32, Ref{Float32}, Ref{Float32}),
        x, s, c,
    )
    return (s[], c[])
end

# Float16: void cr_sincosf16(_Float16 x, _Float16 *sinp, _Float16 *cosp)
function cr_sincos(x::Float16)
    s = Ref{Float16}()
    c = Ref{Float16}()
    ccall(
        (:cr_sincosf16, libcoremath),
        Cvoid,
        (Float16, Ref{Float16}, Ref{Float16}),
        x, s, c,
    )
    return (s[], c[])
end

export cr_sincos

end # module CoreMath
