import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure IsotopicRatio where
  delta18O : Float
  deltaD : Float
  calibrationEquation : String
  delta18OTerm : -60.0 ≤ delta18O ∧ delta18O ≤ 10.0
  deltaDTerm : -500.0 ≤ deltaD ∧ deltaD ≤ 0.0

structure TemperatureCalibration where
  slope : Float
  intercept : Float
  slopeTerm : slope ≠ 0.0

def Paleotemperature (r : IsotopicRatio) (c : TemperatureCalibration) : Float :=
  c.slope * r.delta18O + c.intercept

def IsotopicPaleothermometryValid (r : IsotopicRatio) (c : TemperatureCalibration) : Prop :=
  r.delta18OTerm ∧ r.deltaDTerm ∧ c.slopeTerm

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse