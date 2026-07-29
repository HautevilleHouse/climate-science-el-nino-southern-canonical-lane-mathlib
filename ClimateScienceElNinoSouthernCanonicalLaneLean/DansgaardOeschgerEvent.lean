import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure DansgaardOeschgerEvent where
  eventNumber : Nat
  onsetYear : Int
  duration : Nat
  temperatureAnomaly : Float
  onsetYearTerm : onsetYear < 0
  durationTerm : duration > 100
  temperatureAnomalyTerm : temperatureAnomaly > 2.0

structure AbruptClimateChange where
  events : List DansgaardOeschgerEvent
  eventCount : events.length ≥ 0
  allEventsValid : ∀ e ∈ events, e.onsetYearTerm ∧ e.durationTerm ∧ e.temperatureAnomalyTerm

def DansgaardOeschgerEventClosed (e : DansgaardOeschgerEvent) : Prop :=
  e.onsetYearTerm ∧ e.durationTerm ∧ e.temperatureAnomalyTerm

def AbruptClimateChangeClosed (a : AbruptClimateChange) : Prop :=
  a.allEventsValid

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse