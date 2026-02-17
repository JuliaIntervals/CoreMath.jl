using Test
using CoreMath

@testset "CoreMath" begin
    @testset "Float64" begin
        @testset "Exact values" begin
            @test cr_sin(0.0) === 0.0
            @test cr_cos(0.0) === 1.0
            @test cr_tan(0.0) === 0.0
            @test cr_asin(0.0) === 0.0
            @test cr_acos(1.0) === 0.0
            @test cr_atan(0.0) === 0.0
            @test cr_exp(0.0) === 1.0
            @test cr_expm1(0.0) === 0.0
            @test cr_log(1.0) === 0.0
            @test cr_log1p(0.0) === 0.0
            @test cr_log2(1.0) === 0.0
            @test cr_log10(1.0) === 0.0
            @test cr_cbrt(0.0) === 0.0
            @test cr_cbrt(1.0) === 1.0
            @test cr_sinh(0.0) === 0.0
            @test cr_cosh(0.0) === 1.0
            @test cr_tanh(0.0) === 0.0
            @test cr_erf(0.0) === 0.0
            @test cr_erfc(0.0) === 1.0
            @test cr_tgamma(1.0) === 1.0
            @test cr_lgamma(1.0) === 0.0
            @test cr_exp2(0.0) === 1.0
            @test cr_exp10(0.0) === 1.0
            @test cr_sinpi(0.0) === 0.0
            @test cr_cospi(0.0) === 1.0
        end

        @testset "Approximate agreement with Base" begin
            x = 0.7
            @test cr_sin(x) ≈ sin(x)
            @test cr_cos(x) ≈ cos(x)
            @test cr_tan(x) ≈ tan(x)
            @test cr_asin(x) ≈ asin(x)
            @test cr_acos(x) ≈ acos(x)
            @test cr_atan(x) ≈ atan(x)
            @test cr_exp(x) ≈ exp(x)
            @test cr_expm1(x) ≈ expm1(x)
            @test cr_log(x) ≈ log(x)
            @test cr_log1p(x) ≈ log1p(x)
            @test cr_log2(x) ≈ log2(x)
            @test cr_log10(x) ≈ log10(x)
            @test cr_cbrt(x) ≈ cbrt(x)
            @test cr_sinh(x) ≈ sinh(x)
            @test cr_cosh(x) ≈ cosh(x)
            @test cr_tanh(x) ≈ tanh(x)
            @test cr_asinh(x) ≈ asinh(x)
            @test cr_acosh(1.0 + x) ≈ acosh(1.0 + x)
            @test cr_atanh(x) ≈ atanh(x)
            @test cr_erf(x) ≈ erf(x) atol=1e-15
            @test cr_erfc(x) ≈ erfc(x) atol=1e-15
            @test cr_exp2(x) ≈ exp2(x)
            @test cr_exp10(x) ≈ exp10(x)
        end

        @testset "Bivariate functions" begin
            x, y = 2.0, 3.0
            @test cr_pow(x, y) ≈ x^y
            @test cr_hypot(x, y) ≈ hypot(x, y)
            @test cr_atan2(x, y) ≈ atan(x, y)
            @test cr_pow(1.0, 0.0) === 1.0
            @test cr_hypot(3.0, 4.0) === 5.0
        end

        @testset "sincos" begin
            x = 1.0
            s, c = cr_sincos(x)
            @test s === cr_sin(x)
            @test c === cr_cos(x)

            s0, c0 = cr_sincos(0.0)
            @test s0 === 0.0
            @test c0 === 1.0
        end
    end

    @testset "Float32" begin
        @testset "Exact values" begin
            @test cr_sin(0.0f0) === 0.0f0
            @test cr_cos(0.0f0) === 1.0f0
            @test cr_tan(0.0f0) === 0.0f0
            @test cr_asin(0.0f0) === 0.0f0
            @test cr_acos(1.0f0) === 0.0f0
            @test cr_atan(0.0f0) === 0.0f0
            @test cr_exp(0.0f0) === 1.0f0
            @test cr_expm1(0.0f0) === 0.0f0
            @test cr_log(1.0f0) === 0.0f0
            @test cr_log1p(0.0f0) === 0.0f0
            @test cr_log2(1.0f0) === 0.0f0
            @test cr_log10(1.0f0) === 0.0f0
            @test cr_cbrt(1.0f0) === 1.0f0
            @test cr_sinh(0.0f0) === 0.0f0
            @test cr_cosh(0.0f0) === 1.0f0
            @test cr_tanh(0.0f0) === 0.0f0
            @test cr_erf(0.0f0) === 0.0f0
            @test cr_erfc(0.0f0) === 1.0f0
            @test cr_tgamma(1.0f0) === 1.0f0
            @test cr_lgamma(1.0f0) === 0.0f0
            @test cr_exp2(0.0f0) === 1.0f0
            @test cr_exp10(0.0f0) === 1.0f0
            @test cr_sinpi(0.0f0) === 0.0f0
            @test cr_cospi(0.0f0) === 1.0f0
        end

        @testset "Approximate agreement with Base" begin
            x = 0.7f0
            @test cr_sin(x) ≈ sin(x)
            @test cr_cos(x) ≈ cos(x)
            @test cr_tan(x) ≈ tan(x)
            @test cr_exp(x) ≈ exp(x)
            @test cr_log(x) ≈ log(x)
            @test cr_cbrt(x) ≈ cbrt(x)
            @test cr_sinh(x) ≈ sinh(x)
            @test cr_cosh(x) ≈ cosh(x)
            @test cr_tanh(x) ≈ tanh(x)
        end

        @testset "Bivariate functions" begin
            @test cr_pow(2.0f0, 3.0f0) === 8.0f0
            @test cr_hypot(3.0f0, 4.0f0) === 5.0f0
            @test cr_atan2(1.0f0, 1.0f0) ≈ atan(1.0f0, 1.0f0)
        end

        @testset "sincos" begin
            s, c = cr_sincos(1.0f0)
            @test s === cr_sin(1.0f0)
            @test c === cr_cos(1.0f0)

            s0, c0 = cr_sincos(0.0f0)
            @test s0 === 0.0f0
            @test c0 === 1.0f0
        end
    end

    @testset "Float16" begin
        @testset "Exact values" begin
            @test cr_sin(Float16(0)) === Float16(0)
            @test cr_cos(Float16(0)) === Float16(1)
            @test cr_tan(Float16(0)) === Float16(0)
            @test cr_exp(Float16(0)) === Float16(1)
            @test cr_log(Float16(1)) === Float16(0)
            @test cr_cbrt(Float16(1)) === Float16(1)
            @test cr_sinh(Float16(0)) === Float16(0)
            @test cr_cosh(Float16(0)) === Float16(1)
            @test cr_tanh(Float16(0)) === Float16(0)
            @test cr_erf(Float16(0)) === Float16(0)
            @test cr_erfc(Float16(0)) === Float16(1)
            @test cr_sinpi(Float16(0)) === Float16(0)
            @test cr_cospi(Float16(0)) === Float16(1)
        end

        @testset "Approximate agreement" begin
            x = Float16(0.7)
            @test cr_sin(x) ≈ sin(Float64(x)) atol=Float16(0.001)
            @test cr_cos(x) ≈ cos(Float64(x)) atol=Float16(0.001)
            @test cr_exp(x) ≈ exp(Float64(x)) atol=Float16(0.01)
        end

        @testset "Bivariate functions" begin
            @test cr_pow(Float16(2), Float16(3)) ≈ Float16(8)
            @test cr_hypot(Float16(3), Float16(4)) ≈ Float16(5)
        end

        @testset "sincos" begin
            s, c = cr_sincos(Float16(1))
            @test s === cr_sin(Float16(1))
            @test c === cr_cos(Float16(1))

            s0, c0 = cr_sincos(Float16(0))
            @test s0 === Float16(0)
            @test c0 === Float16(1)
        end
    end
end
