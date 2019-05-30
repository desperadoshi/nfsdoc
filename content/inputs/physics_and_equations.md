---
title: "Physics and Equations"
type: "post"
weight: 2
lastmod: "2019-05-30"
---

# Physics and Equations

- `machref` is required.
- If `ptotref` and `ttotref` are specified, `pref` and `tref` are calculated based on them.
- If `ptotref` and `ttotref` are not specified, specify two of `pref`, `tref` and `rhoref`. If all of `pref`, `tref` and `rhoref` are specified, the user must make sure `pref=rhoref*rgasref*tref`. Otherwise, it reports error.
- For `muref`, the parameter `viscosity_method` determines if the viscosity is constant or depending on the temperature by the Sutherland law.
- If `viscosity_method=2`, the user should specify `suth_muref`, `suth_Tref`, `suth_Sref`. If the user does not specify these 3 parameters for the Sutherland law, the default values are used. `muref` is calculated by the Sutherland law at the temperature `tref`. If `viscosity_method=1`, the user must specify `muref`.

| Input Variable        | Type          | Default Value | Note  | Description                                                                                                                   |
| :------------:        | :-----------: | :-----:       | :---: | :--------------------------------------------------------------------------------                                             |
| `governing_equations` | `integer`     | `2`           | \\    | Specifies the governing equations to use. <br> $\bullet$ `1 :=` Euler equations <br> $\bullet$ `2 :=` Navier-Stokes equations |
| `machref`             | `real`        | `0.4`         | \\    | Reference Mach number.                                                                                                        |
| `gam`                 | `real`        | `1.4`         | \\    | Reference $\gamma$ (ratio of specific heats).                                                                                 |
| `ptotref`             | `real`        | `-1.0`        | \\    | Reference total pressure (units of Pa).                                                                                       |
| `ttotref`             | `real`        | `-1.0`        | \\    | Reference total temperature (units of Kelvin).                                                                                |
| `rhoref`              | `real`        | `-1.0`        | \\    | Reference static density (default evaluates to $1.160833 kg/m^3$ )                                                            |
| `tref`                | `real`        | `300.0`       | \\    | Reference static temperature (units of Kelvin).                                                                               |
| `pref`                | `real`        | `1E5`         | \\    | Reference static pressure (units of Pa).                                                                                      |
| `rgasref`             | `real`        | `287.15`      | \\    | Reference gas constant (units of $m^2/(s^2 K)$ ).                                                                             |
| `alpha_aoaref`        | `real`        | `0.0`         | \\    | Reference angle of attack in the $x-y$ plane.                                                                                 |
| `beta_aoaref`         | `real`        | `0.0`         | \\    | Reference angle of attack in the $x-z$ plane.                                                                                 |
| `Pr`                  | `real`        | `0.72`        | \\    | Laminar Prandtl number.                                                                                                       |
| `suth_muref`          | `real`        | `1.716E-5`    | \\    | Constant $\mu_0$ in Sutherland’s law.                                                                                         |
| `suth_Tref`           | `real`        | `273.0`       | \\    | Constant $T_0$ in Sutherland’s law.                                                                                           |
| `suth_Sref`           | `real`        | `110.4`       | \\    | Constant $S$ in Sutherland’s law.                                                                                             |
| `viscosity_method`    | `integer`     | `1`           | \\    | $\bullet$ `1` := Constant viscosity. <br> $\bullet$ `2` := Sutherland law.                                                    |

