# DualNumbersAD

A Julia package implementing Dual Number arithmetic for Automatic Differentiation.

This repository contains the Julia package **`Yamral`**, developed for the course  
**Introduction to Scientific Computing**.

---

## ✨ Features

- Parametric dual number type
- Support for nested dual numbers
- Operator overloading: `+`, `-`, `*`, `/`, `^`
- Elementary functions: `sin`, `cos`, `exp`, `sqrt`
- First-order derivative computation
- Second-order derivatives using nested dual numbers
- Fully based on Julia multiple dispatch

---

## 📖 Mathematical Background

A dual number is defined as:

D = a + bε

where:

- `a` is the real part
- `b` is the dual part
- ε² = 0

Because ε² = 0, dual numbers naturally propagate derivative information through algebraic operations. This enables **automatic differentiation** without symbolic manipulation or numerical approximation.

---

## ⚙ Installation

### 1️⃣ Clone the Repository

Open your terminal and run:

```bash
git clone https://github.com/Yami2329/DualNumbersAD.git
```

### 2️⃣ Activate the Package in Julia

Navigate into the project directory and start Julia:

```bash
cd DualNumbersAD
julia
```

Then run:

```julia
using Pkg
Pkg.activate(".")
using Yamral
```

---

## 🧮 First-Order Derivative Example

We compute the derivative of:

f(x) = sin(x) + x² + 3x

at x = 2.

### Code

```julia
using Yamral

x = Dual(2.0, 1.0)   # real part = 2, derivative seed = 1
f = sin(x) + x^2 + 3x

println("Function value = ", f.real)
println("First derivative = ", f.dual)
```

### Expected Output

Function value ≈ 10.9093  
First derivative ≈ 6.58385  

---

## 🧮 Second-Order Derivative Example

We compute the second derivative of:

h(x) = x³

at x = 2.

### Code

```julia
using Yamral

x = Dual(Dual(2.0, 1.0), Dual(1.0, 0.0))
h = x^3

println("Function value = ", h.real.real)
println("First derivative = ", h.real.dual)
println("Second derivative = ", h.dual.dual)
```

### Expected Output

Function value = 8  
First derivative = 12  
Second derivative = 12  

---

## 📂 Package Structure

```
DualNumbersAD/
│
├── Project.toml
├── src/
│   └── Yamral.jl
├── README.md
└── LICENSE
```

---

## 🎯 Learning Outcomes

This project demonstrates:

- Julia package development
- Parametric types
- Multiple dispatch
- Operator overloading
- Automatic differentiation
- Nested dual number implementation
- Scientific computing software design

---

## 👨‍🎓 Author

Yamral Kassanew  
Course: Introduction to Scientific Computing  
Instructor: Dr. Hayri Sezer  
Due Date: February 18, 2026
