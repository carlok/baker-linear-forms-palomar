module

public import Mathlib
public import Diaz.Mirror.baker_linear_forms_in_logarithms
public import Diaz.Mirror.schneider_lang_cartesian

public section

/-!
# Proved solution

The proved counterparts of the declarations stated in `Challenge.lean`. Comparator checks that
each has the same name and type as its counterpart there and depends on no axiom beyond
`propext`, `Quot.sound` and `Classical.choice`. Each is the library theorem named beside it,
whose statement is the same up to unfolding the library's abbreviations.

* `BakerLinearForms.baker_linear_forms_in_logarithms`: `Transcendence.baker_linear_forms_in_logarithms`
* `BakerLinearForms.schneider_lang_cartesian`: `Transcendence.schneider_lang_cartesian`
-/

namespace BakerLinearForms

theorem baker_linear_forms_in_logarithms (n : ℕ) (l : Fin n → ℂ)
    (hl : LinearIndependent ℚ l) (hlalg : ∀ i, IsAlgebraic ℚ (Complex.exp (l i)))
    (b₀ : ℂ) (b : Fin n → ℂ) (hb₀ : IsAlgebraic ℚ b₀) (hb : ∀ i, IsAlgebraic ℚ (b i))
    (hne : b₀ ≠ 0 ∨ ∃ i, b i ≠ 0) :
    b₀ + ∑ i, b i * l i ≠ 0 :=
  Transcendence.baker_linear_forms_in_logarithms n l hl hlalg b₀ b hb₀ hb hne

theorem schneider_lang_cartesian {ι : Type*} [Fintype ι] [DecidableEq ι] {d₁ : ℕ}
    (x : Fin d₁ → ι → ℂ) (hxalg : ∀ i ν, IsAlgebraic ℚ (x i ν)) (hxind : LinearIndependent ℚ x)
    (y : ι → ι → ℂ) (hy : LinearIndependent ℂ y)
    (ι₀ : Option ι) (hdim : Fintype.card ι < ι₀.elim 0 (fun _ => 1) + d₁)
    (hy₀ : ∀ k, ι₀ = some k → ∀ j, IsAlgebraic ℚ (y j k))
    (hexp : ∀ i j, IsAlgebraic ℚ (Complex.exp (∑ ν, x i ν * y j ν))) : False :=
  Transcendence.schneider_lang_cartesian x hxalg hxind y hy ι₀ hdim hy₀ hexp

end BakerLinearForms
