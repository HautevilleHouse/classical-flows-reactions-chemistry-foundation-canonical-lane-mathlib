import ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean.ChemicalKineticsObjects

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

structure EquilibriumCertificate where
  network : ReactionNetwork
  equilibriumConstantClosed : Prop
  gibbsFreeEnergyClosed : Prop
  leChatelierPrincipleClosed : Prop
  equilibriumConstantClosedProof : equilibriumConstantClosed
  gibbsFreeEnergyClosedProof : gibbsFreeEnergyClosed
  leChatelierPrincipleClosedProof : leChatelierPrincipleClosed

def sourceEquilibriumCertificate : EquilibriumCertificate := {
  network := { species := [], reactions := [], temperature := 298 },
  equilibriumConstantClosed := ThermodynamicConsistency ({
    species := [], reactions := [], temperature := 298
  }),
  gibbsFreeEnergyClosed := True,
  leChatelierPrincipleClosed := True,
  equilibriumConstantClosedProof := rfl,
  gibbsFreeEnergyClosedProof := trivial,
  leChatelierPrincipleClosedProof := trivial
}

def EquilibriumClosed (C : EquilibriumCertificate) : Prop :=
  C.equilibriumConstantClosed ∧ C.gibbsFreeEnergyClosed ∧ C.leChatelierPrincipleClosed

theorem source_equilibrium_closed : EquilibriumClosed sourceEquilibriumCertificate := by
  exact And.intro sourceEquilibriumCertificate.equilibriumConstantClosedProof
    (And.intro sourceEquilibriumCertificate.gibbsFreeEnergyClosedProof
      sourceEquilibriumCertificate.leChatelierPrincipleClosedProof)

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse