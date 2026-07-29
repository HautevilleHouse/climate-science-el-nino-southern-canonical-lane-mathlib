import HautevilleHouse.ClimateScienceElNinoSouthernCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ENSOSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ENSOAdmittedObject where
  space : ENSOSpace
  ensoDynamicsCaptured : Prop
  keyMechanismsClosed : Prop
  conclusion : ensoDynamicsCaptured ∧ keyMechanismsClosed

structure ENSOEndgameState where
  object : ENSOAdmittedObject

def ENSOWitnessClosed (O : ENSOAdmittedObject) : Prop :=
  O.ensoDynamicsCaptured ∧ O.keyMechanismsClosed

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse