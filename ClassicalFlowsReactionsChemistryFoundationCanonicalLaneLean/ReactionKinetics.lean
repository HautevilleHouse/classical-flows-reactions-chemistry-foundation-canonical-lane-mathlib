import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

abbrev Concentration := ℝ
abbrev RateConstant := ℝ
abbrev Time := ℝ

structure ReactionNetwork where
  species : List String
  reactions : List (List Nat × List Nat × RateConstant)
  initial : List Concentration
  stoichiometry : List (List Int)
  rateLaws : List (Concentration → Concentration → Concentration)

def waterFormation : ReactionNetwork :=
  { species := ["H2", "O2", "H2O"]
    reactions := [([2, 1], [2], 1.0), ([2], [2, 1], 0.5)]
    initial := [2.0, 1.0, 0.0]
    stoichiometry := [[-2, -1, 2], [2, 1, -2]]
    rateLaws := fun cH2 cO2 => (cH2 ^ 2) * cO2 ; fun cH2O => cH2O ^ 2
  }

structure EquilibriumCondition where
  forwardRate : RateConstant
  reverseRate : RateConstant
  equilibriumConstant : ℝ
  equilibriumReached : Prop

def equilibriumConstant (kf kr : RateConstant) : ℝ := kf / kr

theorem equilibrium_constant_from_rates (kf kr : RateConstant) (h : kr ≠ 0) :
    equilibriumConstant kf kr = kf / kr := by
  rfl

theorem equilibrium_reached_iff_rates_equal (Eq : EquilibriumCondition) :
    Eq.equilibriumReached ↔ Eq.forwardRate * Eq.equilibriumConstant = Eq.reverseRate := by
  constructor
  · intro h; exact h
  · intro h; exact h

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse