import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure BjerknesCompensationPackage where
  heatTransport : Type u
  windStressCurlAnomaly : Type u
  compensationRatio : ℝ
  compensationBound : Prop
  compensationBoundTerm : compensationBound

structure BjerknesCompensationEvidence (B : BjerknesCompensationPackage) where
  compensationBoundClosed : B.compensationBound

def BjerknesCompensationClosed (B : BjerknesCompensationPackage) : Prop :=
  B.compensationBound

theorem bjerknes_compensation_closed_from_evidence (B : BjerknesCompensationPackage)
    (E : BjerknesCompensationEvidence B) : BjerknesCompensationClosed B :=
  E.compensationBoundClosed

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse