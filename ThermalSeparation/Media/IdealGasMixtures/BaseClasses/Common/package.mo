within ThermalSeparation.Media.IdealGasMixtures.BaseClasses;
package Common

  replaceable record FluidConstants
    "Extended fluid constants"
    Media.Types.Temperature criticalTemperature "critical temperature";
    Media.Types.AbsolutePressure criticalPressure "critical pressure";
    Media.Types.MolarVolume criticalMolarVolume "critical molar Volume";
    Real acentricFactor "Pitzer acentric factor";
    Media.Types.Temperature triplePointTemperature "triple point temperature";
    Media.Types.AbsolutePressure triplePointPressure "triple point pressure";
    Media.Types.Temperature meltingPoint "melting point at 101325 Pa";
    Media.Types.Temperature normalBoilingPoint "normal boiling point (at 101325 Pa)";
    Modelica.Units.SI.ElectricDipoleMomentOfMolecule dipoleMoment
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
    Boolean hasAcentricFactor=false "true if Pitzer accentric factor is known";
    Media.Types.SpecificEnthalpy HCRIT0=0.0
      "Critical specific enthalpy of the fundamental equation";
    Media.Types.SpecificEntropy SCRIT0=0.0
      "Critical specific entropy of the fundamental equation";
    Media.Types.SpecificEnthalpy deltah=0.0
      "Difference between specific enthalpy model (h_m) and f.eq. (h_f) (h_m - h_f)";
    Media.Types.SpecificEntropy deltas=0.0
      "Difference between specific enthalpy model (s_m) and f.eq. (s_f) (s_m - s_f)";
  end FluidConstants;

  record BasePropertiesRecord
    "Variables contained in every instance of BaseProperties"
    extends Modelica.Icons.Record;
    Media.Types.AbsolutePressure p "Absolute pressure of medium";
    Media.Types.Density d "Density of medium";
    Media.Types.Temperature T "Temperature of medium";
    Media.Types.MassFraction[nX] X(start=reference_X)
      "Mass fractions (=
(component mass)/total mass  m_i/m)";
    Media.Types.MassFraction[nXi] Xi(start=reference_X[1:nXi])
      "Structurally independent mass fractions" annotation (Hide=true);
    // SpecificEnthalpy h "Specific enthalpy of medium";
    // SpecificInternalEnergy u "Specific internal energy of medium";
    Media.Types.SpecificHeatCapacity R "Gas constant (of mixture if applicable)";
    Media.Types.MolarMass MM "Molar mass (of mixture or single fluid)";
    annotation(Documentation(info="<html></html>"));
  end BasePropertiesRecord;

  // explicit derivative functions for finite element models

  package Choices "Types, constants to define menu choices"
    package Init
      "Type, constants and menu choices to define initialization, as temporary solution until enumerations are available"

      extends Modelica.Icons.Package;
      constant Integer NoInit=1;
      constant Integer InitialStates=2;
      constant Integer SteadyState=3;
      constant Integer SteadyMass=4;
      type Temp
        "Temporary type with choices for menus (until enumerations are available)"

        extends Integer;
        annotation (Evaluate=true, choices(
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Init.
                NoInit "NoInit (no initialization)",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Init.
                InitialStates "InitialStates (initialize medium states)",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Init.
                SteadyState "SteadyState (initialize in steady state)",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Init.
                SteadyMass
              "SteadyMass (initialize density or pressure in steady state)"));
      end Temp;
      annotation (preferedView="text");
    end Init;

    package ReferenceEnthalpy
      "Type, constants and menu choices to define reference enthalpy, as temporary solution until enumerations are available"

      extends Modelica.Icons.Package;
      constant Integer ZeroAt0K=1;
      constant Integer ZeroAt25C=2;
      constant Integer UserDefined=3;
      type Temp
        "Temporary type with choices for menus (until enumerations are available)"

        extends Integer;
        annotation (Evaluate=true, choices(
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.ReferenceEnthalpy.
                ZeroAt0K
              "The enthalpy is 0 at 0 K (default), if the enthalpy of formation is excluded",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.ReferenceEnthalpy.
                ZeroAt25C
              "The enthalpy is 0 at 25 degC, if the enthalpy of formation is excluded",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.ReferenceEnthalpy.
                UserDefined
              "The user-defined reference enthalpy is used at 293.15 K (25 degC)"));

      end Temp;
      annotation (preferedView="text");
    end ReferenceEnthalpy;

    package ReferenceEntropy
      "Type, constants and menu choices to define reference entropy, as temporary solution until enumerations are available"

      extends Modelica.Icons.Package;
      constant Integer ZeroAt0K=1;
      constant Integer ZeroAt0C=2;
      constant Integer UserDefined=3;
      type Temp
        "Temporary type with choices for menus (until enumerations are available)"

        extends Integer;
        annotation (Evaluate=true, choices(
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Init.
                ZeroAt0K "The entropy is 0 at 0 K (default)",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Init.
                ZeroAt0C "The entropy is 0 at 0 degC",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Init.
                UserDefined
              "The user-defined reference entropy is used at 293.15 K (25 degC)"));

      end Temp;
      annotation (preferedView="text");
    end ReferenceEntropy;

    package pd
      "Type, constants and menu choices to define whether p or d are known, as temporary solution until enumerations are available"

      extends Modelica.Icons.Package;
      constant Integer default=1;
      constant Integer p_known=2;
      constant Integer d_known=3;

      type Temp
        "Temporary type with choices for menus (until enumerations are available)"

        extends Integer;
        annotation (Evaluate=true, choices(
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.pd.default
              "default (no boundary condition for p or d)",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.pd.p_known
              "p_known (pressure p is known)",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.pd.d_known
              "d_known (density d is known)"));
      end Temp;
      annotation (preferedView="text");
    end pd;

    package Th
      "Type, constants and menu choices to define whether T or h are known, as temporary solution until enumerations are available"

      extends Modelica.Icons.Package;
      constant Integer default=1;
      constant Integer T_known=2;
      constant Integer h_known=3;

      type Temp
        "Temporary type with choices for menus (until enumerations are available)"

        extends Integer;
        annotation (Evaluate=true, choices(
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Th.default
              "default (no boundary condition for T or h)",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Th.T_known
              "T_known (temperature T is known)",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Th.h_known
              "h_known (specific enthalpy h is known)"));
      end Temp;
      annotation (preferedView="text");
    end Th;

    package Explicit
      "Type, constants and menu choices to define the explicitly given state variable inputs"

      constant Integer dT_explicit=0 "explicit in density and temperature";
      constant Integer ph_explicit=1
        "explicit in pressure and specific enthalpy";
      constant Integer ps_explicit=2
        "explicit in pressure and specific entropy";
      constant Integer pT_explicit=3 "explicit in pressure and temperature";

      type Temp
        "Temporary type with choices for menus (until enumerations are available)"
        extends Integer(min=0,max=3);
        annotation (Evaluate=true, choices(
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Explicit.dT_explicit
              "explicit in d and T",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Explicit.ph_explicit
              "explicit in p and h",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Explicit.ps_explicit
              "explicit in p and s",
            choice=Modelica.Media.Interfaces.PartialMedium.Choices.Explicit.pT_explicit
              "explicit in p and s"));
      end Temp;
    end Explicit;
  end Choices;

end Common;
