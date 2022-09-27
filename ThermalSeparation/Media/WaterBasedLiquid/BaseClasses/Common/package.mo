within ThermalSeparation.Media.WaterBasedLiquid.BaseClasses;
package Common
  replaceable record FluidConstants
    "critical, triple, molecular and other standard data of fluid"
    extends Modelica.Icons.Record;
    String iupacName "complete IUPAC name (or common name, if non-existent)";
    String casRegistryNumber
      "chemical abstracts sequencing number (if it exists)";
    String chemicalFormula
      "Chemical formula, (brutto, nomenclature according to Hill";
    String structureFormula "Chemical structure formula";
      ThermalSeparation.Media.BaseMediumLiquid.MolarMass molarMass "molar mass";
      ThermalSeparation.Media.BaseMediumLiquid.Temperature criticalTemperature "critical temperature";
      ThermalSeparation.Media.BaseMediumLiquid.AbsolutePressure criticalPressure "critical pressure";
      ThermalSeparation.Media.BaseMediumLiquid.MolarVolume criticalMolarVolume "critical molar Volume";
      Real acentricFactor "Pitzer acentric factor";
      ThermalSeparation.Media.BaseMediumLiquid.Temperature triplePointTemperature "triple point temperature";
      ThermalSeparation.Media.BaseMediumLiquid.AbsolutePressure triplePointPressure "triple point pressure";
      ThermalSeparation.Media.BaseMediumLiquid.Temperature meltingPoint "melting point at 101325 Pa";
      ThermalSeparation.Media.BaseMediumLiquid.Temperature normalBoilingPoint "normal boiling point (at 101325 Pa)";
      ThermalSeparation.Media.BaseMediumLiquid.DipoleMoment dipoleMoment
      "dipole moment of molecule in Debye (1 debye = 3.33564e10-30 C.m)";
      Boolean hasIdealGasHeatCapacity=false
      "true if ideal gas heat capacity is available";
      Boolean hasCriticalData=false "true if critical data are known";
      Boolean hasDipoleMoment=false "true if a dipole moment known";
      Boolean hasFundamentalEquation=false "true if a fundamental equation";
      Boolean hasLiquidHeatCapacity=false
      "true if liquid heat capacity is available";
      Boolean hasSolidHeatCapacity=false
      "true if solid heat capacity is available";
      Boolean hasAccurateViscosityData=false
      "true if accurate data for a viscosity function is available";
      Boolean hasAccurateConductivityData=false
      "true if accurate data for thermal conductivity is available";
      Boolean hasVapourPressureCurve=false
      "true if vapour pressure data, e.g. Antoine coefficents are known";
      Boolean hasAcentricFactor=false
      "true if Pitzer accentric factor is known";
      ThermalSeparation.Media.BaseMediumLiquid.SpecificEnthalpy HCRIT0=0.0
      "Critical specific enthalpy of the fundamental equation";
      ThermalSeparation.Media.BaseMediumLiquid.SpecificEntropy SCRIT0=0.0
      "Critical specific entropy of the fundamental equation";
      ThermalSeparation.Media.BaseMediumLiquid.SpecificEnthalpy deltah=0.0
      "Difference between specific enthalpy model (h_m) and f.eq. (h_f) (h_m - h_f)";
      ThermalSeparation.Media.BaseMediumLiquid.SpecificEntropy deltas=0.0
      "Difference between specific enthalpy model (s_m) and f.eq. (s_f) (s_m - s_f)";

    annotation(Documentation(info="<html></html>"));
  end FluidConstants;
  
  
  replaceable record SaturationProperties
    "Saturation properties of two phase medium"
    extends Modelica.Icons.Record;
    ThermalSeparation.Media.BaseMediumLiquid.AbsolutePressure psat "saturation pressure";
    ThermalSeparation.Media.BaseMediumLiquid.Temperature Tsat "saturation temperature";
    annotation(Documentation(info="<html></html>"));
  end SaturationProperties;

end Common;
