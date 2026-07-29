import ClimateScienceElNinoSouthernCanonicalLaneLean.BridgeLemmas
import ClimateScienceElNinoSouthernCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

def ConstrainedENSOClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_enso_endgame (A : AdmissibleClass) : ConstrainedENSOClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse