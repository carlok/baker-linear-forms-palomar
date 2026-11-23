# Baker's theorem on linear forms in logarithms, and the Schneider–Lang criterion for ℂ^{d₀} × (ℂ^×)^{d₁} with d₀ ≤ 1

A Lean 4 and Mathlib proof of baker's theorem and the Schneider–Lang criterion, prepared for
the [Palomar registry](https://palomar-registry.org/). It is a self-contained extract of the
library [carlok/diaz-modulus-lean](https://github.com/carlok/diaz-modulus-lean), which is the
canonical home of the proofs.

## Results

- `BakerLinearForms.baker_linear_forms_in_logarithms`: **Baker's theorem** (Baker 1966). If
  `l₁, …, lₙ` are logarithms of algebraic numbers, linearly independent over `ℚ`, then `1, l₁, …,
  lₙ` are linearly independent over the algebraic numbers: `b₀ + b₁ l₁ + ⋯ + bₙ lₙ ≠ 0` for
  algebraic `b₀, …, bₙ` not all zero. Source: Baker 1966; in the form of Waldschmidt 2000,
  Theorem 1.6.
- `BakerLinearForms.schneider_lang_cartesian`: **The criterion of Schneider–Lang for `ℂ^{d₀} ×
  (ℂ^×)^{d₁}`, `d₀ ≤ 1`** (Waldschmidt 2000, Corollary 4.2). Let `n = |ι|`, let `x₁, …, x_{d₁} ∈
  ℂⁿ` have algebraic coordinates and be linearly independent over `ℚ`, let `y₁, …, yₙ` be a basis
  of `ℂⁿ`, and if `d₀ = 1` let the `k`-th coordinates of the `yⱼ` be algebraic. If `n < d₀ + d₁`,
  then the numbers `exp ⟨xᵢ, yⱼ⟩` are not all algebraic. Source: Waldschmidt 2000, Corollary 4.2,
  case d₀ ≤ 1, by the direct proof of §4.6.

## Layout

- `Challenge.lean`: the statements, with deliberate `sorry`, importing Mathlib only.
- `Solution.lean`: the same statements, proved by the library theorems.
- `Diaz/`: the 35 library modules the proofs need, copied from diaz-modulus-lean at
  `59d5a598c292` and changed only for the Lean module system (`module`, `public import`,
  `@[expose] public section`). Paths and namespaces are the library's.
- `comparator.json`, `formalization.yaml`: the Palomar submission metadata.

## Build

```bash
lake exe cache get && lake build
```

Lean 4.35.0, Mathlib v4.35.0. `scripts/verify-comparator.sh` runs the toolchain's
`lake comparator` the way Palomar does.

## Related

- The six exponentials theorem from the same library is registered separately as
  [PALOMAR-2026-11-22-000020](https://palomar-registry.org/entry?id=PALOMAR-2026-11-22-000020&version=1).
- Submissions go to https://submit.palomar-registry.org/.

## Authorship

Claude agents (Anthropic) wrote the Lean statements and proofs under Carlo Perassi's direction;
see `formalization.yaml` and the library's `docs/method.md`. Licence: Apache-2.0.
