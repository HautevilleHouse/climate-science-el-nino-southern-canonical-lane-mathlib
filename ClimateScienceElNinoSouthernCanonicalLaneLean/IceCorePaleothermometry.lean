import ClimateScienceElNinoSouthernCanonicalLaneLean.MilankovitchCycles

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure IceCoreProxy where
  delta18O : ℝ
  deltaD : ℝ
  deuteriumExcess : ℝ

deglaciationTemperatureFromDelta18O : ℝ → ℝ := fun d => -5.0 * d + 10.0

structure DansgaardOeschgerEvent where
  onsetTime : ℕ
  duration : ℕ
  temperatureAnomaly : ℝ
  evidenceDelta : IceCoreProxy

structure DansgaardOeschgerEvidence (D : DansgaardOeschgerEvent) where
  δ18OThresholdMet : D.evidenceDelta.delta18O < -35
  deuteriumExcessNegative : D.evidenceDelta.deuteriumExcess < 0
  temperatureAnomalyClosed : D.temperatureAnomaly > 8.0

def DansgaardOeschgerClosed (D : DansgaardOeschgerEvent) : Prop :=
  D.evidenceDelta.delta18O < -35 ∧
  D.evidenceDelta.deuteriumExcess < 0 ∧
  D.temperatureAnomaly > 8.0

theorem dansgaard_oeschger_closed_from_evidence (D : DansgaardOeschgerEvent) (E : DansgaardOeschgerEvidence D) :
    DansgaardOeschgerClosed D := by
  exact And.intro E.δ18OThresholdMet (And.intro E.deuteriumExcessNegative E.temperatureAnomalyClosed)

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse