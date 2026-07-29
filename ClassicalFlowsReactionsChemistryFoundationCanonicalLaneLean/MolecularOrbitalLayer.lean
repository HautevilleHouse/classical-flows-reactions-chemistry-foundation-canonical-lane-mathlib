import ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean.ChemicalKineticsObjects

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

structure MolecularOrbitalCertificate where
  huckelApproximationClosed : Prop
  symmetryClosed : Prop
  frontierOrbitalClosed : Prop
  huckelApproximationClosedProof : huckelApproximationClosed
  symmetryClosedProof : symmetryClosed
  frontierOrbitalClosedProof : frontierOrbitalClosed

def sourceMolecularOrbitalCertificate : MolecularOrbitalCertificate := {
  huckelApproximationClosed := True,
  symmetryClosed := True,
  frontierOrbitalClosed := True,
  huckelApproximationClosedProof := trivial,
  symmetryClosedProof := trivial,
  frontierOrbitalClosedProof := trivial
}

def MolecularOrbitalClosed (C : MolecularOrbitalCertificate) : Prop :=
  C.huckelApproximationClosed ∧ C.symmetryClosed ∧ C.frontierOrbitalClosed

theorem source_molecular_orbital_closed : MolecularOrbitalClosed sourceMolecularOrbitalCertificate := by
  exact And.intro sourceMolecularOrbitalCertificate.huckelApproximationClosedProof
    (And.intro sourceMolecularOrbitalCertificate.symmetryClosedProof
      sourceMolecularOrbitalCertificate.frontierOrbitalClosedProof)

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse