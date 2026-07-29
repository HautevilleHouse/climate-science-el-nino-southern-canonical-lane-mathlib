import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure SSTAnomaly where
  region : String
  anomaly : ℝ
  time : ℝ

structure WindStressAnomaly where
  u : ℝ
  v : ℝ
  time : ℝ

structure ThermoclineDepth where
  depth : ℝ
  time : ℝ

structure OceanAtmosphereCoupling where
  sstToWind : SSTAnomaly → WindStressAnomaly → Prop
  windToThermocline : WindStressAnomaly → ThermoclineDepth → Prop
  thermoclineToSST : ThermoclineDepth → SSTAnomaly → Prop

def couplingPositiveFeedback (C : OceanAtmosphereCoupling) : Prop :=
  ∀ sst : SSTAnomaly, ∃ wind : WindStressAnomaly, ∃ depth : ThermoclineDepth,
    C.sstToWind sst wind ∧ C.windToThermocline wind depth ∧ C.thermoclineToSST depth sst

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse