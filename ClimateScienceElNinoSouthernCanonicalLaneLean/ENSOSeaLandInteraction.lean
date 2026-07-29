import ClimateScienceElNinoSouthernCanonicalLaneLean.EnergyBalanceModel

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure SeaSurfaceTemperatureField where
  nino34Index : ℝ → ℝ
  pacificTemperature : ℝ × ℝ → ℝ

structure WindStressCoupling where
  equatorialUpwelling : ℝ → ℝ
  thermoclineDepth : ℝ → ℝ
  overturningStrength : ℝ → ℝ

structure ENSOState where
  sst : SeaSurfaceTemperatureField
  wind : WindStressCoupling
  elNinoThreshold : ℝ
  laNinaThreshold : ℝ

structure ENSOEvidence (E : ENSOState) where
  sstClimatology : ∀ t : ℝ, E.sst.nino34Index t > -2 ∧ E.sst.nino34Index t < 2
  windAnomalyThreshold : ∀ t : ℝ, E.laNinaThreshold ≤ E.sst.nino34Index t ∧ E.sst.nino34Index t ≤ E.elNinoThreshold →
    E.wind.equatorialUpwelling t > 0
  thresholdPositivity : E.elNinoThreshold > 0.5 ∧ E.laNinaThreshold < -0.5

def ENSOClosed (E : ENSOState) : Prop :=
  (∀ t : ℝ, E.sst.nino34Index t > -2 ∧ E.sst.nino34Index t < 2) ∧
  (∀ t : ℝ, E.laNinaThreshold ≤ E.sst.nino34Index t ∧ E.sst.nino34Index t ≤ E.elNinoThreshold →
    E.wind.equatorialUpwelling t > 0) ∧
  (E.elNinoThreshold > 0.5 ∧ E.laNinaThreshold < -0.5)

theorem enso_closed_from_evidence (E : ENSOState) (Ev : ENSOEvidence E) : ENSOClosed E := by
  exact And.intro Ev.sstClimatology (And.intro Ev.windAnomalyThreshold Ev.thresholdPositivity)

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse