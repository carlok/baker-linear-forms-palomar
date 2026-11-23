module

public import Mathlib

public section

/-!
# Baker's theorem on linear forms in logarithms, and the Schneider–Lang criterion for ℂ^{d₀} × (ℂ^×)^{d₁} with d₀ ≤ 1

The statements below are the results this repository registers. Each is stated with Mathlib's
own notions and nothing defined here; each `sorry` is deliberate, and `Solution.lean` proves
the same statement from the library under `Diaz/`.

## `BakerLinearForms.baker_linear_forms_in_logarithms`

**Baker's theorem** (Baker 1966). If `l₁, …, lₙ` are logarithms of algebraic numbers, linearly
independent over `ℚ`, then `1, l₁, …, lₙ` are linearly independent over the algebraic numbers:
`b₀ + b₁ l₁ + ⋯ + bₙ lₙ ≠ 0` for algebraic `b₀, …, bₙ` not all zero.

* `l : Fin n → ℂ` is the family `l₁, …, lₙ`; `hlalg` says each `exp (l i)` is algebraic over
  `ℚ`, so each `l i` is a logarithm of an algebraic number (any branch).
* `LinearIndependent ℚ l` is Mathlib's linear independence over `ℚ`.
* `b₀` and `b i` are algebraic over `ℚ` and not all zero (`hne`); the conclusion is `b₀ + ∑ i,
  b i * l i ≠ 0`.
* Source: Baker 1966; in the form of Waldschmidt 2000, Theorem 1.6.

## `BakerLinearForms.schneider_lang_cartesian`

**The criterion of Schneider–Lang for `ℂ^{d₀} × (ℂ^×)^{d₁}`, `d₀ ≤ 1`** (Waldschmidt 2000,
Corollary 4.2). Let `n = |ι|`, let `x₁, …, x_{d₁} ∈ ℂⁿ` have algebraic coordinates and be
linearly independent over `ℚ`, let `y₁, …, yₙ` be a basis of `ℂⁿ`, and if `d₀ = 1` let the
`k`-th coordinates of the `yⱼ` be algebraic. If `n < d₀ + d₁`, then the numbers `exp ⟨xᵢ, yⱼ⟩`
are not all algebraic.

* `ι` indexes the coordinates of `ℂⁿ`, `n = Fintype.card ι`; `x i : ι → ℂ` and `y j : ι → ℂ`
  are vectors.
* `hxalg` and `hxind`: the `d₁` vectors `x i` have algebraic coordinates and are linearly
  independent over `ℚ`; `hy`: the `n` vectors `y j` are linearly independent over `ℂ`.
* `ι₀ : Option ι` encodes `d₀ ∈ {0, 1}`: `none` is `d₀ = 0`; `some k` is `d₀ = 1` with the
  algebraic coordinate `k` (`hy₀`). `ι₀.elim 0 (fun _ => 1)` is `d₀`, and `hdim` is `n < d₀ +
  d₁`.
* `hexp` says every `exp (∑ ν, x i ν * y j ν)` is algebraic; the conclusion is `False`.
* Source: Waldschmidt 2000, Corollary 4.2, case d₀ ≤ 1, by the direct proof of §4.6.
-/

namespace BakerLinearForms

/-- **Baker's theorem** (Baker 1966). If `l₁, …, lₙ` are logarithms of algebraic numbers, linearly
independent over `ℚ`, then `1, l₁, …, lₙ` are linearly independent over the algebraic numbers:
`b₀ + b₁ l₁ + ⋯ + bₙ lₙ ≠ 0` for algebraic `b₀, …, bₙ` not all zero. -/
theorem baker_linear_forms_in_logarithms (n : ℕ) (l : Fin n → ℂ)
    (hl : LinearIndependent ℚ l) (hlalg : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    (b₀ : ℂ) (b : Fin n → ℂ) (hb₀ : IsAlgebraic ℚ b₀) (hb : ∀ i, IsAlgebraic ℚ (b i))
    (hne : b₀ ≠ 0 ∨ ∃ i, b i ≠ 0) :
    b₀ + ∑ i, b i * l i ≠ 0 := by
  sorry

/-- **The criterion of Schneider–Lang for `ℂ^{d₀} × (ℂ^×)^{d₁}`, `d₀ ≤ 1`** (Waldschmidt 2000,
Corollary 4.2). Let `n = |ι|`, let `x₁, …, x_{d₁} ∈ ℂⁿ` have algebraic coordinates and be
linearly independent over `ℚ`, let `y₁, …, yₙ` be a basis of `ℂⁿ`, and if `d₀ = 1` let the
`k`-th coordinates of the `yⱼ` be algebraic. If `n < d₀ + d₁`, then the numbers `exp ⟨xᵢ, yⱼ⟩`
are not all algebraic. -/
theorem schneider_lang_cartesian {ι : Type*} [Fintype ι] [DecidableEq ι] {d₁ : ℕ}
    (x : Fin d₁ → ι → ℂ) (hxalg : ∀ i ν, IsAlgebraic ℚ (x i ν)) (hxind : LinearIndependent ℚ x)
    (y : ι → ι → ℂ) (hy : LinearIndependent ℂ y)
    (ι₀ : Option ι) (hdim : Fintype.card ι < ι₀.elim 0 (fun _ => 1) + d₁)
    (hy₀ : ∀ k, ι₀ = some k → ∀ j, IsAlgebraic ℚ (y j k))
    (hexp : ∀ i j, IsAlgebraic ℚ (Complex.exp (∑ ν, x i ν * y j ν))) : False := by
  sorry

end BakerLinearForms
