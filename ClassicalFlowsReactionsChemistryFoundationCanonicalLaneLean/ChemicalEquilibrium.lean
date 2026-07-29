import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

abbrev Concentration := ℝ
abbrev EquilibriumConstant := ℝ

def zeroConcentration : Concentration := 0

def oneConcentration : Concentration := 1

structure Reaction where
  reactants : List (String × ℕ)
  products : List (String × ℕ)
  equilibriumConstant : EquilibriumConstant

def zeroReaction : Reaction := {
  reactants := []
  products := []
  equilibriumConstant := 0
}

structure EquilibriumOperators where
  massAction : Reaction → List Concentration → Prop
  leChatelier : Reaction → Temperature → Pressure → Prop
  gibbsEnergy : Reaction → ℝ → ℝ

def primitiveEquilibriumOperators : EquilibriumOperators := {
  massAction := fun _ _ => True
  leChatelier := fun _ _ _ => True
  gibbsEnergy := fun _ _ => 0
}

structure EquilibriumSystem where
  reactions : List Reaction
  concentrations : List Concentration
  operators : EquilibriumOperators
  equilibriumState : Prop

def primitiveEquilibriumSystem : EquilibriumSystem := {
  reactions := []
  concentrations := []
  operators := primitiveEquilibriumOperators
  equilibriumState := True
}

def EquilibriumClosed (E : EquilibriumSystem) : Prop :=
  E.operators.massAction (zeroReaction) [] ∧
  E.operators.leChatelier zeroReaction 0 0 ∧
  E.equilibriumState

theorem primitive_equilibrium_closed : EquilibriumClosed primitiveEquilibriumSystem := by
  exact And.intro trivial (And.intro trivial trivial)

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse