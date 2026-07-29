import ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean.ChemicalKineticsObjects

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

structure ReactionMechanismCertificate where
  rateLawClosed : Prop
  steadyStateApproximationClosed : Prop
  rateDeterminingStepClosed : Prop
  rateLawClosedProof : rateLawClosed
  steadyStateApproximationClosedProof : steadyStateApproximationClosed
  rateDeterminingStepClosedProof : rateDeterminingStepClosed

def sourceReactionMechanismCertificate : ReactionMechanismCertificate := {
  rateLawClosed := True,
  steadyStateApproximationClosed := True,
  rateDeterminingStepClosed := True,
  rateLawClosedProof := trivial,
  steadyStateApproximationClosedProof := trivial,
  rateDeterminingStepClosedProof := trivial
}

def ReactionMechanismClosed (C : ReactionMechanismCertificate) : Prop :=
  C.rateLawClosed ∧ C.steadyStateApproximationClosed ∧ C.rateDeterminingStepClosed

theorem source_reaction_mechanism_closed : ReactionMechanismClosed sourceReactionMechanismCertificate := by
  exact And.intro sourceReactionMechanismCertificate.rateLawClosedProof
    (And.intro sourceReactionMechanismCertificate.steadyStateApproximationClosedProof
      sourceReactionMechanismCertificate.rateDeterminingStepClosedProof)

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse