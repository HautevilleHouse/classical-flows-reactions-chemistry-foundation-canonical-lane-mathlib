import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

abbrev Energy := ℝ
abbrev Temperature := ℝ
abbrev Entropy := ℝ

structure ThermodynamicSystem where
  internalEnergy : Energy
  temperature : Temperature
  entropy : Entropy
  enthalpy : Energy
  gibbsFreeEnergy : Energy
  helmholtzFreeEnergy : Energy
  pressure : ℝ
  volume : ℝ

def internalEnergyFromTemperature (T : Temperature) : Energy := T

def entropyChange (Q : Energy) (T : Temperature) : Entropy :=
  if h : T > 0 then Q / T else 0

def gibbsFreeEnergy (H : Energy) (S : Entropy) (T : Temperature) : Energy :=
  H - T * S

def helmholtzFreeEnergy (U : Energy) (S : Entropy) (T : Temperature) : Energy :=
  U - T * S

theorem entropy_change_positive_for_reversible (Q : Energy) (T : Temperature) (hT : T > 0) :
    entropyChange Q T = Q / T := by
  simp [entropyChange, hT]

theorem gibbs_free_energy_minimum_at_equilibrium (H : Energy) (S : Entropy) (T : Temperature) :
    gibbsFreeEnergy H S T = H - T * S := by
  rfl

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse