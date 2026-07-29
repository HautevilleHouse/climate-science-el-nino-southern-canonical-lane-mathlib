import ClimateScienceElNinoSouthernCanonicalLaneLean.RechargeOscillator

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure BjerknesFeedback (A : AdmissibleClass) where
  windAnomalyStrength : ℝ → ℝ
  sstAnomalyStrength : ℝ
  feedbackCoefficient : ℝ
  feedbackCoefficientPositive : feedbackCoefficient > 0
  bjerknesLoopObserved : A.object.windSstPositiveFeedback

def BjerknesFeedbackClosed (A : AdmissibleClass) (B : BjerknesFeedback A) : Prop :=
  B.feedbackCoefficientPositive ∧ B.bjerknesLoopObserved

theorem bjerknes_feedback_closed_intro (A : AdmissibleClass) (B : BjerknesFeedback A) :
    BjerknesFeedbackClosed A B := by
  exact And.intro B.feedbackCoefficientPositive B.bjerknesLoopObserved

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse