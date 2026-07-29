import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure IceCoreSample where
  depth : ℝ
  delta18O : ℝ
  deuteriumExcess : ℝ
  age : ℝ

structure PaleoclimateRecord where
  samples : List IceCoreSample
  timeCovered : ℝ
  resolution : ℝ

structure MilankovitchForcing where
  eccentricity : ℝ → ℝ
  obliquity : ℝ → ℝ
  precession : ℝ → ℝ

structure DansgaardOeschgerEvent where
  onsetAge : ℝ
  duration : ℝ
  temperatureAnomaly : ℝ
  greenlandTempRise : ℝ

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse