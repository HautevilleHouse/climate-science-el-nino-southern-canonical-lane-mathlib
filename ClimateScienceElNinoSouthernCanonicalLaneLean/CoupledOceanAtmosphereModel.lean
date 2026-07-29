import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClimateScienceElNinoSouthernCanonicalLaneLean.ENSOIndexPackage

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure CoupledOceanAtmosphereModel {D : ClimateDataPackage} {I : ENSOIndexPackage D} where
  shallowWaterEquations : Prop
  windStressCoupling : Prop
  thermoclineFeedback : Prop
  bjerknesFeedback : Prop
  delayedOscillatorMechanism : Prop
  rechargeOscillator : Prop
  modelResolution : Prop

structure CoupledModelEvidence {D : ClimateDataPackage} {I : ENSOIndexPackage D} (M : CoupledOceanAtmosphereModel D I) where
  shallowWaterEquationsClosed : M.shallowWaterEquations
  windStressCouplingClosed : M.windStressCoupling
  thermoclineFeedbackClosed : M.thermoclineFeedback
  bjerknesFeedbackClosed : M.bjerknesFeedback
  delayedOscillatorMechanismClosed : M.delayedOscillatorMechanism
  rechargeOscillatorClosed : M.rechargeOscillator
  modelResolutionClosed : M.modelResolution

def CoupledModelClosed {D : ClimateDataPackage} {I : ENSOIndexPackage D} (M : CoupledOceanAtmosphereModel D I) : Prop :=
  M.shallowWaterEquations ∧ M.windStressCoupling ∧ M.thermoclineFeedback ∧
  M.bjerknesFeedback ∧ M.delayedOscillatorMechanism ∧ M.rechargeOscillator ∧ M.modelResolution

theorem coupled_model_closed_from_evidence {D : ClimateDataPackage} {I : ENSOIndexPackage D} (M : CoupledOceanAtmosphereModel D I) (E : CoupledModelEvidence M) :
    CoupledModelClosed M := by
  exact And.intro E.shallowWaterEquationsClosed
    (And.intro E.windStressCouplingClosed
      (And.intro E.thermoclineFeedbackClosed
        (And.intro E.bjerknesFeedbackClosed
          (And.intro E.delayedOscillatorMechanismClosed
            (And.intro E.rechargeOscillatorClosed E.modelResolutionClosed)))))

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse