import ClimateScienceElNinoSouthernCanonicalLaneLean.ENSOSeaLandInteraction

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure SouthernOscillationIndex where
  pressureDarwin : ℝ
  pressureTahiti : ℝ
  index : ℝ := pressureTahiti - pressureDarwin

structure TeleconnectionPattern where
  rossbyWaveSource : ℝ → ℝ
  tropicalExtratropicalCoupling : ℝ → ℝ → ℝ
  precipitationAnomaly : ℝ × ℝ → ℝ

structure SouthernOscillationState where
  soi : SouthernOscillationIndex
  teleconnection : TeleconnectionPattern
  oscillationPeriod : ℕ

structure SouthernOscillationEvidence (S : SouthernOscillationState) where
  soiNegativeDuringElNino : S.soi.index < -10
  teleconnectionClosed : ∀ (x y : ℝ), S.teleconnection.precipitationAnomaly (x,y) ∈ Set.Ioo (-5) 5
  oscillationPeriodPositivity : S.oscillationPeriod > 2 ∧ S.oscillationPeriod < 7

def SouthernOscillationClosed (S : SouthernOscillationState) : Prop :=
  S.soi.index < -10 ∧
  (∀ (x y : ℝ), S.teleconnection.precipitationAnomaly (x,y) > -5 ∧ S.teleconnection.precipitationAnomaly (x,y) < 5) ∧
  (S.oscillationPeriod > 2 ∧ S.oscillationPeriod < 7)

theorem southern_oscillation_closed_from_evidence (S : SouthernOscillationState) (E : SouthernOscillationEvidence S) :
    SouthernOscillationClosed S := by
  exact And.intro E.soiNegativeDuringElNino (And.intro E.teleconnectionClosed E.oscillationPeriodPositivity)

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse