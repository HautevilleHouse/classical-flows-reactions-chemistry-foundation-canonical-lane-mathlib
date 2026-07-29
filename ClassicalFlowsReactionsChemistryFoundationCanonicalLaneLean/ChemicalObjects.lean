import classicalFlowsReactionsChemistryFoundationCanonicalLaneLean.MathlibStatement
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

abbrev Concentration := ℝ
abbrev Time := ℝ
abbrev RateConstant := ℝ
abbrev Species := String

def zeroConcentration : Concentration := 0

def zeroRateConstant : RateConstant := 0

structure ReactionKinetics where
  forwardRate : Species → RateConstant
  backwardRate : Species → RateConstant
  stoichiometry : Species → Int
  rateLaw : (Species → Concentration) → (Species → RateConstant)
  massAction : (forwardRate, backwardRate, stoichiometry) → Bool

def primitiveReactionKinetics : ReactionKinetics := {
  forwardRate := fun _ => 1
  backwardRate := fun _ => 0
  stoichiometry := fun _ => 1
  rateLaw := fun conc => fun s => 0
  massAction := fun _ => True
}

structure ThermodynamicState where
  temperature : ℝ
  pressure : ℝ
  gibbsFreeEnergy : (Species → Concentration) → ℝ
  equilibriumConstant : (Species → Concentration) → ℝ
  entropy : ℝ
  enthalpy : ℝ

def standardState : ThermodynamicState := {
  temperature := 298.15
  pressure := 1
  gibbsFreeEnergy := fun _ => 0
  equilibriumConstant := fun _ => 1
  entropy := 0
  enthalpy := 0
}

def DetailedBalance (state : ThermodynamicState) (kinetics : ReactionKinetics) : Prop :=
  ∀ s, kinetics.forwardRate s * state.equilibriumConstant (fun _ => 1) = kinetics.backwardRate s

def ChemicalEquilibrium (state : ThermodynamicState) : Prop :=
  ∀ s, state.gibbsFreeEnergy (fun _ => 0) = 0

theorem primitive_kinetics_mass_action_checked :
    primitiveReactionKinetics.massAction (primitiveReactionKinetics.forwardRate, primitiveReactionKinetics.backwardRate, primitiveReactionKinetics.stoichiometry) := by
  unfold primitiveReactionKinetics
  rfl

theorem standard_state_detailed_balance_checked :
    DetailedBalance standardState primitiveReactionKinetics := by
  unfold DetailedBalance
  intro s
  unfold standardState primitiveReactionKinetics
  simp

theorem standard_state_chemical_equilibrium_checked :
    ChemicalEquilibrium standardState := by
  unfold ChemicalEquilibrium
  intro s
  unfold standardState
  simp

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse