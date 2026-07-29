import ClimateScienceElNinoSouthernCanonicalLaneLean.BjerknesFeedback

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ENSOEndpoint (A : AdmissibleClass) where
  nino34Index : ℝ → ℝ
  onsetPrediction : ℝ
  peakPhase : String
  decayPrediction : ℝ
  nino34Positive : nino34Index 0 > 0
  ensoCycleObserved : A.object.ensoCycleClosure

def ENSOEndpointClosed (A : AdmissibleClass) (E : ENSOEndpoint A) : Prop :=
  E.nino34Positive ∧ E.ensoCycleObserved

theorem enso_endpoint_closed_intro (A : AdmissibleClass) (E : ENSOEndpoint A) :
    ENSOEndpointClosed A E := by
  exact And.intro E.nino34Positive E.ensoCycleObserved

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse