import ClimateScienceElNinoSouthernCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ZonalWindProfile where
  latitude : ℝ → ℝ
  verticalLevel : ℝ → ℝ
  annualCycleShift : ℝ
  qboPhase : ℕ
  qboAmplitude : ℝ

structure PrimitiveZonalWindStructure (A : AdmissibleClass) where
  equatorialWind : ZonalWindProfile
  tradeWindIntensity : ℝ
  westerlyWindBurst : ℝ → ℝ
  equatorialWindConsistent : A.object.windFieldObservations
  tradeWindIntensityClosed : tradeWindIntensity > 0

def ZonalWindClosed (A : AdmissibleClass) (Z : PrimitiveZonalWindStructure A) : Prop :=
  Z.equatorialWindConsistent ∧ Z.tradeWindIntensityClosed

theorem zonal_wind_closed_intro (A : AdmissibleClass) (Z : PrimitiveZonalWindStructure A) :
    ZonalWindClosed A Z := by
  exact And.intro Z.equatorialWindConsistent Z.tradeWindIntensityClosed

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse