import ClimateScienceElNinoSouthernCanonicalLaneLean.OceanAtmosphereCoupling

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure RechargeOscillator (A : AdmissibleClass) where
  heatContent : ℝ → ℝ
  equatorialSst : ℝ → ℝ
  growthRate : ℝ
  period : ℝ
  growthRatePositive : growthRate > 0
  rechargeBalanceObserved : A.object.heatContentRecharge

def RechargeOscillatorClosed (A : AdmissibleClass) (R : RechargeOscillator A) : Prop :=
  R.growthRatePositive ∧ R.rechargeBalanceObserved

theorem recharge_oscillator_closed_intro (A : AdmissibleClass) (R : RechargeOscillator A) :
    RechargeOscillatorClosed A R := by
  exact And.intro R.growthRatePositive R.rechargeBalanceObserved

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse