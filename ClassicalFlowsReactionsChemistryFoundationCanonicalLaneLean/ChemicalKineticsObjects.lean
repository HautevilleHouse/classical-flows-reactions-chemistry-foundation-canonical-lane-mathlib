import ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

abbrev Concentration := ℝ
abbrev RateConstant := ℝ
abbrev Temperature := ℝ
abbrev Time := ℝ

structure ChemicalSpecies where
  name : String
  concentration : Concentration → Time → Concentration

structure Reaction where
  reactants : List ChemicalSpecies
  products : List ChemicalSpecies
  rateConstant : RateConstant
  temperatureDependence : Temperature → RateConstant

def zeroConcentration : Time → Concentration := fun _ => 0

def elementaryReaction : Reaction := {
  reactants := [],
  products := [],
  rateConstant := 1,
  temperatureDependence := fun T => 1
}

structure ReactionNetwork where
  species : List ChemicalSpecies
  reactions : List Reaction
  temperature : Temperature

def lawOfMassAction (r : Reaction) (t : Time) : RateConstant :=
  r.rateConstant * (r.reactants.map (fun s => s.concentration s.name t)).prod

def equilibriumConstant (r : Reaction) (T : Temperature) : RateConstant :=
  r.temperatureDependence T

def ThermodynamicConsistency (R : ReactionNetwork) : Prop :=
  ∀ r : R.reactions, equilibriumConstant r R.temperature > 0

def ChemicalKineticsBalance (R : ReactionNetwork) : Prop :=
  ThermodynamicConsistency R

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse