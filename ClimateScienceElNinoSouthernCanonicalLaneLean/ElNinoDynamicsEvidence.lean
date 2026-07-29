import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ElNinoDynamicsEvidence (A : AdmissibleClass) where
  bridgeClosed : A.endpointSatisfied
  gateClosed : A.remainderRecorded

def ElNinoDynamicsClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∧ A.remainderRecorded

theorem el_nino_dynamics_closed_from_evidence (A : AdmissibleClass) (E : ElNinoDynamicsEvidence A) : ElNinoDynamicsClosed A :=
  And.intro E.bridgeClosed E.gateClosed

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse