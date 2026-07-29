import ClimateScienceElNinoSouthernCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure MilankovitchCycles where
  eccentricity : ℝ
  obliquity : ℝ
  precession : ℝ
  insolationAt65North : ℝ → ℝ

structure MilankovitchCyclesEvidence (M : MilankovitchCycles) where
  eccentricityBound : M.eccentricity > 0
  obliquityRange : 22.1 ≤ M.obliquity ∧ M.obliquity ≤ 24.5
  precessionPeriod : 19000 ≤ M.precession ∧ M.precession ≤ 26000
  insolationCalcClosed : ∀ t : ℝ, M.insolationAt65North t > 0

def MilankovitchCyclesClosed (M : MilankovitchCycles) : Prop :=
  M.eccentricity > 0 ∧ 
  (22.1 ≤ M.obliquity ∧ M.obliquity ≤ 24.5) ∧
  (19000 ≤ M.precession ∧ M.precession ≤ 26000) ∧
  (∀ t : ℝ, M.insolationAt65North t > 0)

theorem milankovitch_closed_from_evidence (M : MilankovitchCycles) (E : MilankovitchCyclesEvidence M) :
    MilankovitchCyclesClosed M := by
  exact And.intro E.eccentricityBound
    (And.intro E.obliquityRange
      (And.intro E.precessionPeriod E.insolationCalcClosed))

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse