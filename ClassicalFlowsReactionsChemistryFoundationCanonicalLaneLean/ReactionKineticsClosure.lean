import classicalFlowsReactionsChemistryFoundationCanonicalLaneLean.ReactionKineticsCertificate

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

def ReactionKineticsAdmittedClosure : Prop :=
  ReactionKineticsCertificateClosed sourceReactionKineticsCertificate ∧
  ConstrainedReactionClosure chemistryAdmissibleClass

def UnrestrictedClassicalReactionBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  mathlibPDESubstrate.unrestrictedNavierStokesStackCarried = true

theorem reaction_kinetics_admitted_closure_checked :
    ReactionKineticsAdmittedClosure := by
  exact And.intro source_reaction_kinetics_certificate_closed
    (constrained_reaction_closure chemistryAdmissibleClass)

theorem unrestricted_classical_reaction_boundary_carried_checked :
    UnrestrictedClassicalReactionBoundaryCarried := by
  exact And.intro rfl rfl

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse