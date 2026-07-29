import classicalFlowsReactionsChemistryFoundationCanonicalLaneLean.ThermodynamicsLayer

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

structure ReactionKineticsCertificate where
  substrate : MathlibPDESubstrate
  kineticsClosed : Prop
  thermodynamicsClosed : Prop
  orbitalClosed : Prop
  cycleClosed : Prop
  canonicalCarriageImported : Prop
  kineticsClosedProof : kineticsClosed
  thermodynamicsClosedProof : thermodynamicsClosed
  orbitalClosedProof : orbitalClosed
  cycleClosedProof : cycleClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceReactionKineticsCertificate : ReactionKineticsCertificate := {
  substrate := mathlibPDESubstrate
  kineticsClosed := DetailedBalance standardState primitiveReactionKinetics ∧ ChemicalEquilibrium standardState
  thermodynamicsClosed := ThermodynamicCycleClosed primitiveCycle
  orbitalClosed := AufbauPrinciple primitiveElectronicStructure ∧ FrontierOrbitalGapClosed primitiveElectronicStructure
  cycleClosed := True
  canonicalCarriageImported := commonCoreProjectionLawAvailable ∧ commonCoreCarriageLawAvailable ∧ commonCoreIdempotenceAvailable
  kineticsClosedProof := And.intro standard_state_detailed_balance_checked standard_state_chemical_equilibrium_checked
  thermodynamicsClosedProof := primitive_cycle_closed_checked
  orbitalClosedProof := And.intro primitive_aufbau_principle_checked primitive_frontier_gap_closed_checked
  cycleClosedProof := rfl
  canonicalCarriageImportedProof := And.intro mathlib_common_core_projection_law_checked
    (And.intro mathlib_common_core_carriage_law_checked mathlib_common_core_idempotence_checked)
}

def ReactionKineticsCertificateClosed (C : ReactionKineticsCertificate) : Prop :=
  C.kineticsClosed ∧ C.thermodynamicsClosed ∧ C.orbitalClosed ∧ C.cycleClosed ∧ C.canonicalCarriageImported

theorem source_reaction_kinetics_certificate_closed :
    ReactionKineticsCertificateClosed sourceReactionKineticsCertificate := by
  exact And.intro sourceReactionKineticsCertificate.kineticsClosedProof
    (And.intro sourceReactionKineticsCertificate.thermodynamicsClosedProof
      (And.intro sourceReactionKineticsCertificate.orbitalClosedProof
        (And.intro sourceReactionKineticsCertificate.cycleClosedProof
          sourceReactionKineticsCertificate.canonicalCarriageImportedProof)))

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse