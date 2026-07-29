import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClimateScienceElNinoSouthernCanonicalLaneLean.ENSOClosurePackage

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ElNinoAdmissibleClass where
  object : ENSOClosurePackage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedElNinoClosure (A : ElNinoAdmissibleClass) : Prop :=
  (ENSOClosureClosed A.object) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse