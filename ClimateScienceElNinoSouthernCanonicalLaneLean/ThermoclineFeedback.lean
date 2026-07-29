import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ThermoclineFeedbackPackage where
  oceanBasin : Type u
  thermoclineDepth : oceanBasin → ℝ
  windStressCurl : oceanBasin → ℝ
  sstAnomaly : oceanBasin → ℝ
  linearCouplingCoeff : ℝ
  couplingClosed : Prop
  couplingClosedTerm : couplingClosed

structure ThermoclineFeedbackEvidence (T : ThermoclineFeedbackPackage) where
  couplingClosedEvidence : T.couplingClosed

def ThermoclineFeedbackClosed (T : ThermoclineFeedbackPackage) : Prop :=
  T.couplingClosed

theorem thermocline_feedback_closed_from_evidence (T : ThermoclineFeedbackPackage)
    (E : ThermoclineFeedbackEvidence T) : ThermoclineFeedbackClosed T :=
  E.couplingClosedEvidence

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse