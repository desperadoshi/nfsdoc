---
title: "Initialization"
type: "post"
weight: 2
lastmod: "2019-05-30"
---

# Initialization

| Input Variable      | Type                 | Default Value | Note  | Description                                                                                                                                                                                                                                                                                                                                            |
| :------------:      | :-----------:        | :-----:       | :---: | :--------------------------------------------------------------------------------                                                                                                                                                                                                                                                                      |
| `itestcase`         | `integer`            | `1`           | \\    | Specifies the test-case/problem to solve, primarily affecting the initialization of the simulation. <br> $\bullet$ `1 :=` Generic flow, initialize to reference conditions. <br> $\bullet$ `2 :=` Diagonally propagating Shu version of the isentropic Euler vortex. <br> $\bullet$ `3 :=` Channel flow (not working)                                  |
| `load_restart_file` | `logical`            | `.FALSE.`     | \\    | Logical flag used to indicate whether or not to read in a restart file.                                                                                                                                                                                                                                                                                |
| `restart_file`      | `character(len=150)` | `out.rst`     | \\    | File path to the solution restart file that will be read if `load_restart_file` is true.                                                                                                                                                                                                                                                               |
| `restart_interval`  | `integer`            | `0`           | \\    | Number of time steps between writing restart files. <br> <span style="color:blue">NOTE</span>: A restart file is always written after completing the last time step.                                                                                                                                                                                   |
| `time_ave_file`     | `character(len=150)` | `out.ave`     | \\    | File path to the time-averaged solution restart file that will be read in if `load_restart_file` and `output_time_averaging` are both true. The code will add the accumulation of time-averaged flow variables from the new running simulation to the time-averaged flow variables of the previous simulation from which the new simulation restarted. |
| `flpini_prof_input` | `prof_input_t`       | \\            | \\    | Input file for the initialization of the flat plate case. The data type is the same as `cpbc_prof_input`. Refer to it for explanations.                                                                                                                                                                                                                |

