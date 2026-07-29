import ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean.ThermodynamicsLayer
import ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean.MolecularOrbitalLayer
import ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean.ReactionMechanismLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

structure ChemicalClosureCertificate where
  thermodynamics : ThermodynamicsCertificate
  molecularOrbital : MolecularOrbitalCertificate
  reactionMechanism : ReactionMechanismCertificate
  chemicalEquilibrium : EquilibriumCertificate
  thermodynamicsClosedProof : ThermodynamicsClosed thermodynamics
  molecularOrbitalClosedProof : MolecularOrbitalClosed molecularOrbital
  reactionMechanismClosedProof : ReactionMechanismClosed reactionMechanism
  chemicalEquilibriumClosedProof : EquilibriumClosed chemicalEquilibrium

def sourceChemicalClosureCertificate : ChemicalClosureCertificate := {
  thermodynamics := sourceThermodynamicsCertificate,
  molecularOrbital := sourceMolecularOrbitalCertificate,
  reactionMechanism := sourceReactionMechanismCertificate,
  chemicalEquilibrium := sourceEquilibriumCertificate,
  thermodynamicsClosedProof := source_thermodynamics_closed,
  molecularOrbitalClosedProof := source_molecular_orbital_closed,
  reactionMechanismClosedProof := source_reaction_mechanism_closed,
  chemicalEquilibriumClosedProof := source_equilibrium_closed
}

def ChemicalClosureClosed (C : ChemicalClosureCertificate) : Prop :=
  ThermodynamicsClosed C.thermodynamics ∧
  MolecularOrbitalClosed C.molecularOrbital ∧
  ReactionMechanismClosed C.reactionMechanism ∧
  EquilibriumClosed C.chemicalEquilibrium

theorem source_chemical_closure_closed : ChemicalClosureClosed sourceChemicalClosureCertificate := by
  exact And.intro sourceChemicalClosureCertificate.thermodynamicsClosedProof
    (And.intro sourceChemicalClosureCertificate.molecularOrbitalClosedProof
      (And.intro sourceChemicalClosureCertificate.reactionMechanismClosedProof
        sourceChemicalClosureCertificate.chemicalEquilibriumClosedProof))

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse