import ClimateScienceElNinoSouthernCanonicalLaneLean.PrimitiveZonalWindStructure

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure OceanAtmosphereCoupling (A : AdmissibleClass) where
  sstAnomaly : ℝ → ℝ
  thermoclineDepth : ℝ → ℝ
  windStressCurl : ℝ → ℝ
  couplingStrength : ℝ
  couplingStrengthPositive : couplingStrength > 0
  windStressCurlConsistent : A.object.windStressCurlSources

def OceanCouplingClosed (A : AdmissibleClass) (C : OceanAtmosphereCoupling A) : Prop :=
  C.couplingStrengthPositive ∧ C.windStressCurlConsistent

theorem ocean_coupling_closed_intro (A : AdmissibleClass) (C : OceanAtmosphereCoupling A) :
    OceanCouplingClosed A C := by
  exact And.intro C.couplingStrengthPositive C.windStressCurlConsistent

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse