import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure PaleoclimateRecord where
  proxyType : String
  timeSeries : Nat → Float
  ageModel : Prop
  resolution : Float
  proxyTypeTerm : proxyType = "δ18O" ∨ proxyType = "Mg/Ca"
  ageModelTerm : ageModel
  resolutionTerm : resolution > 0.0

def PaleoclimateRecordValid (r : PaleoclimateRecord) : Prop :=
  r.ageModel ∧ r.resolution > 0.0

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse