import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean

abbrev Wavefunction := ℝ
abbrev OrbitalEnergy := ℝ

structure MolecularOrbital where
  label : String
  wavefunction : Wavefunction
  energy : OrbitalEnergy
  occupation : ℕ
  symmetry : String

def hydrogenAtomOrbital : MolecularOrbital := {
  label := "1s"
  wavefunction := 1.0
  energy := -13.6
  occupation := 1
  symmetry := "spherical"
}

def carbonAtomOrbital : MolecularOrbital := {
  label := "2p"
  wavefunction := 1.0
  energy := -10.0
  occupation := 2
  symmetry := "axial"
}

structure MolecularOrbitalDiagram where
  orbitals : List MolecularOrbital
  huckelApproximation : Bool
  homo : MolecularOrbital
  lumo : MolecularOrbital
  bandGap : OrbitalEnergy

def bandGap (homo lumo : MolecularOrbital) : OrbitalEnergy :=
  lumo.energy - homo.energy

theorem band_gap_positive (homo lumo : MolecularOrbital) (h : lumo.energy > homo.energy) :
    bandGap homo lumo > 0 := by
  dsimp [bandGap]
  linarith

theorem homo_occupied (diagram : MolecularOrbitalDiagram) :
    diagram.homo.occupation > 0 := by
  exact Nat.one_le_iff_ne_zero.mp (by
    have : diagram.homo.occupation ≥ 1 := by
      sorry
    exact this)

end ClassicalFlowsReactionsChemistryFoundationCanonicalLaneLean
end HautevilleHouse