import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure OceanicNinoIndex where
  sstAnomaly : Float
  threshold : Float
  thresholdTerm : threshold = 0.5
  elNinoCondition : sstAnomaly ≥ threshold
  laNinaCondition : sstAnomaly ≤ -threshold

def ENSOState (o : OceanicNinoIndex) : String :=
  if o.elNinoCondition then "El Niño"
  else if o.laNinaCondition then "La Niña"
  else "Neutral"

def OceanicNinoIndexValid (o : OceanicNinoIndex) : Prop :=
  o.thresholdTerm ∧ (o.elNinoCondition ∨ o.laNinaCondition ∨ ¬(o.elNinoCondition ∨ o.laNinaCondition))

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse