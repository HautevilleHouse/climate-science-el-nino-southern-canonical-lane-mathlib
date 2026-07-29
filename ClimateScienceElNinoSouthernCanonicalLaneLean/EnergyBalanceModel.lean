import ClimateScienceElNinoSouthernCanonicalLaneLean.IceCorePaleothermometry

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure EnergyBalanceParameterization where
  solarConstant : ℝ
  albedo : ℝ
  emissionCoeff : ℝ
  tau : ℝ

structure EnergyBalanceModel where
  latitude : ℝ → ℝ
  temperature : ℝ → ℝ
  netRadiation : ℝ → ℝ
  parameters : EnergyBalanceParameterization

structure EnergyBalanceEvidence (E : EnergyBalanceModel) where
  temperatureGradientClosed : ∀ x : ℝ, E.temperature x > -50 ∧ E.temperature x < 50
  netRadiationClosed : ∀ x : ℝ, E.netRadiation x = 
    (1 - E.parameters.albedo) * E.parameters.solarConstant / 4 * (1 + 0.5 * (1 - 3 * Real.sin x ^ 2)) - 
    E.parameters.emissionCoeff * (E.temperature x) ^ 4
  paramBounds : E.parameters.solarConstant > 1300 ∧ E.parameters.solarConstant < 1400 ∧
    E.parameters.albedo > 0.2 ∧ E.parameters.albedo < 0.4 ∧
    E.parameters.emissionCoeff > 0.5 ∧ E.parameters.emissionCoeff < 1.0 ∧
    E.parameters.tau > 0.5 ∧ E.parameters.tau < 1.0

def EnergyBalanceModelClosed (E : EnergyBalanceModel) : Prop :=
  (∀ x : ℝ, E.temperature x > -50 ∧ E.temperature x < 50) ∧
  (∀ x : ℝ, E.netRadiation x = (1 - E.parameters.albedo) * E.parameters.solarConstant / 4 *
    (1 + 0.5 * (1 - 3 * Real.sin x ^ 2)) - 
    E.parameters.emissionCoeff * (E.temperature x) ^ 4) ∧
  (E.parameters.solarConstant > 1300 ∧ E.parameters.solarConstant < 1400 ∧
    E.parameters.albedo > 0.2 ∧ E.parameters.albedo < 0.4 ∧
    E.parameters.emissionCoeff > 0.5 ∧ E.parameters.emissionCoeff < 1.0 ∧
    E.parameters.tau > 0.5 ∧ E.parameters.tau < 1.0)

theorem energy_balance_closed_from_evidence (E : EnergyBalanceModel) (Ev : EnergyBalanceEvidence E) :
    EnergyBalanceModelClosed E := by
  exact And.intro Ev.temperatureGradientClosed (And.intro Ev.netRadiationClosed Ev.paramBounds)

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse