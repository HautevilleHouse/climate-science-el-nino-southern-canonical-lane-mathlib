import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClimateScienceElNinoSouthernCanonicalLaneLean.ClimateDataPackage

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ENSOIndexPackage {D : ClimateDataPackage} where
  nino34Index : Type u
  soiIndex : Type v
  oniIndex : Type w
  warmColdPhaseClassification : Prop
  indexThresholdsDefined : Prop
  anomalyCalculation : Prop

structure ENSOIndexEvidence {D : ClimateDataPackage} (I : ENSOIndexPackage D) where
  warmColdPhaseClassificationClosed : I.warmColdPhaseClassification
  indexThresholdsDefinedClosed : I.indexThresholdsDefined
  anomalyCalculationClosed : I.anomalyCalculation

def ENSOIndexClosed {D : ClimateDataPackage} (I : ENSOIndexPackage D) : Prop :=
  I.warmColdPhaseClassification ∧ I.indexThresholdsDefined ∧ I.anomalyCalculation

theorem enso_index_closed_from_evidence {D : ClimateDataPackage} (I : ENSOIndexPackage D) (E : ENSOIndexEvidence I) :
    ENSOIndexClosed I := by
  exact And.intro E.warmColdPhaseClassificationClosed (And.intro E.indexThresholdsDefinedClosed E.anomalyCalculationClosed)

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse