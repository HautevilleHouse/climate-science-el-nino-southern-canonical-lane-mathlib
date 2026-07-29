import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure BjerknesFeedbackEvidence (A : AdmissibleClass) where
  bridgeClosed : A.endpointSatisfied
  gateClosed : A.remainderRecorded

def BjerknesFeedbackClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∧ A.remainderRecorded

theorem bjerknes_feedback_closed_from_evidence (A : AdmissibleClass) (E : BjerknesFeedbackEvidence A) : BjerknesFeedbackClosed A :=
  And.intro E.bridgeClosed E.gateClosed

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse