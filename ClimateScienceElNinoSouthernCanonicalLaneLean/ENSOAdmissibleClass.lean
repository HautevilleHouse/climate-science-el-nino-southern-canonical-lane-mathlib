import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ENSOAdmittedObject where
  sstRecord : Type u
  nino3Index : ℝ
  soiIndex : ℝ
  ensoState : Prop
  conclusion : ensoState

def ENSOWitnessClosed (O : ENSOAdmittedObject) : Prop :=
  O.conclusion

structure AdmissibleClass where
  object : ENSOAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ENSOWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse