import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure OrbitalParameters where
  eccentricity : Float
  obliquity : Float
  precession : Float
  eccentricityTerm : 0.0 ≤ eccentricity ∧ eccentricity ≤ 0.06
  obliquityTerm : 22.0 ≤ obliquity ∧ obliquity ≤ 25.0
  precessionTerm : -1.0 ≤ precession ∧ precession ≤ 1.0

structure MilankovitchCycle where
  orbital : OrbitalParameters
  timeScale : Nat
  insolationAnomaly : Float
  insolationAnomalyTerm : insolationAnomaly ≠ 0.0

def OrbitalForcingClosed (O : OrbitalParameters) : Prop :=
  O.eccentricityTerm ∧ O.obliquityTerm ∧ O.precessionTerm

def MilankovitchCycleClosed (M : MilankovitchCycle) : Prop :=
  OrbitalForcingClosed M.orbital ∧ M.insolationAnomalyTerm

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse