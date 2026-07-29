import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClimateScienceElNinoSouthernCanonicalLaneLean

structure ClimateDataPackage where
  seaSurfaceTemperature : Type u
  atmosphericPressure : Type v
  windStress : Type w
  thermoclineDepth : Type x
  timeSeries : Type y
  monthlyResolution : Prop
  globalCoverage : Prop
  dataQuality : Prop

structure ClimateDataEvidence (D : ClimateDataPackage) where
  monthlyResolutionClosed : D.monthlyResolution
  globalCoverageClosed : D.globalCoverage
  dataQualityClosed : D.dataQuality

def ClimateDataClosed (D : ClimateDataPackage) : Prop :=
  D.monthlyResolution ∧ D.globalCoverage ∧ D.dataQuality

theorem climate_data_closed_from_evidence (D : ClimateDataPackage) (E : ClimateDataEvidence D) :
    ClimateDataClosed D := by
  exact And.intro E.monthlyResolutionClosed (And.intro E.globalCoverageClosed E.dataQualityClosed)

end ClimateScienceElNinoSouthernCanonicalLaneLean
end HautevilleHouse