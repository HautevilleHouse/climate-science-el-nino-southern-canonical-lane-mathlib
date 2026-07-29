import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClimateScienceElNinoSouthernCanonicalLaneLean.CoupledOceanAtmosphereModel

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ENSOClosurePackage {D : ClimateDataPackage} {I : ENSOIndexPackage D} {M : CoupledOceanAtmosphereModel D I} where
  predictionSkill : Prop
  interannualVariabilityCaptured : Prop
  teleconnectionImpact : Prop
  seasonalForecastUtility : Prop
  frameworkPredictivePower : Prop

structure ENSOClosureEvidence {D : ClimateDataPackage} {I : ENSOIndexPackage D} {M : CoupledOceanAtmosphereModel D I} (C : ENSOClosurePackage D I M) where
  predictionSkillClosed : C.predictionSkill
  interannualVariabilityCapturedClosed : C.interannualVariabilityCaptured
  teleconnectionImpactClosed : C.teleconnectionImpact
  seasonalForecastUtilityClosed : C.seasonalForecastUtility
  frameworkPredictivePowerClosed : C.frameworkPredictivePower

def ENSOClosureClosed {D : ClimateDataPackage} {I : ENSOIndexPackage D} {M : CoupledOceanAtmosphereModel D I} (C : ENSOClosurePackage D I M) : Prop :=
  C.predictionSkill ∧ C.interannualVariabilityCaptured ∧ C.teleconnectionImpact ∧
  C.seasonalForecastUtility ∧ C.frameworkPredictivePower

theorem enso_closure_closed_from_evidence {D : ClimateDataPackage} {I : ENSOIndexPackage D} {M : CoupledOceanAtmosphereModel D I} (C : ENSOClosurePackage D I M) (E : ENSOClosureEvidence C) :
    ENSOClosureClosed C := by
  exact And.intro E.predictionSkillClosed
    (And.intro E.interannualVariabilityCapturedClosed
      (And.intro E.teleconnectionImpactClosed
        (And.intro E.seasonalForecastUtilityClosed E.frameworkPredictivePowerClosed)))

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse