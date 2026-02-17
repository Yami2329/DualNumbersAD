module Yamral

# Export Dual type so users can access it after `using Yamral`
export Dual

# Import Base operators and functions that we will overload
import Base: +, -, *, /, ^, sin, cos, exp, sqrt

# ============================================================
# Dual Number Definition
# A dual number has the form:
#       D = a + bε
# where ε^2 = 0
#
# real -> stores function value
# dual -> stores derivative value
# ============================================================

struct Dual{T}
    real::T   # real part (function value)
    dual::T   # dual part (derivative)
end

# ============================================================
# ADDITION
# (a + bε) + (c + dε) = (a + c) + (b + d)ε
# ============================================================

+(a::Dual, b::Dual) =
    Dual(a.real + b.real,
         a.dual + b.dual)

# Real + Dual
+(a::Real, b::Dual) =
    Dual(a + b.real,
         b.dual)

# Dual + Real
+(a::Dual, b::Real) =
    Dual(a.real + b,
         a.dual)

# ============================================================
# SUBTRACTION
# (a + bε) - (c + dε) = (a - c) + (b - d)ε
# ============================================================

-(a::Dual, b::Dual) =
    Dual(a.real - b.real,
         a.dual - b.dual)

# ============================================================
# MULTIPLICATION
# (a + bε)(c + dε) = ac + (ad + bc)ε
# ============================================================

*(a::Dual, b::Dual) =
    Dual(a.real * b.real,
         a.real*b.dual + a.dual*b.real)

# Real * Dual
*(a::Real, b::Dual) =
    Dual(a*b.real,
         a*b.dual)

# Dual * Real
*(a::Dual, b::Real) =
    Dual(a.real*b,
         a.dual*b)

# ============================================================
# DIVISION
# (a + bε)/(c + dε)
# = a/c + ((bc - ad)/c^2) ε
# ============================================================

/(a::Dual, b::Dual) =
    Dual(a.real / b.real,
         (a.dual*b.real - a.real*b.dual) / b.real^2)

# ============================================================
# POWER OPERATIONS
# ============================================================

# Dual raised to a real power
# (a + bε)^n = a^n + n*a^(n-1)*b ε
^(a::Dual, n::Real) =
    Dual(a.real^n,
         n * a.real^(n-1) * a.dual)

# Real raised to a dual power
# a^(c + dε) = a^c + a^c ln(a) d ε
^(a::Real, b::Dual) =
    Dual(a^b.real,
         a^b.real * log(a) * b.dual)

# ============================================================
# ELEMENTARY FUNCTIONS
# ============================================================

# sin(a + bε) = sin(a) + cos(a)b ε
sin(a::Dual) =
    Dual(sin(a.real),
         cos(a.real)*a.dual)

# cos(a + bε) = cos(a) - sin(a)b ε
cos(a::Dual) =
    Dual(cos(a.real),
         -sin(a.real)*a.dual)

# exp(a + bε) = exp(a) + exp(a)b ε
exp(a::Dual) =
    Dual(exp(a.real),
         exp(a.real)*a.dual)

# sqrt(a + bε) = sqrt(a) + b/(2√a) ε
sqrt(a::Dual) =
    Dual(sqrt(a.real),
         a.dual/(2*sqrt(a.real)))

end
