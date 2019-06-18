---
title: "Base FR Configuration"
type: "post"
weight: 2
lastmod: "2019-05-30"
---

# Base FR Configuration

| Input Variable     | Type          | Default Value | Note  | Description                                                                                                                                                                                                                                                                                                        |
| :------------:     | :-----------: | :-----:       | :---: | :--------------------------------------------------------------------------------                                                                                                                                                                                                                                  |
| `solution_order`   | `integer`     | `3`           | \\    | Specifies the degree of the polynomial space, $\mathcal{P_S}$, to use for the solution. <br> <span style="color:blue">NOTE</span>: The order-of-accuracy is approximately $\mathcal{P_S}+1$.                                                                                                                       |
| `loc_solution_pts` | `integer`     | `1`           | \\    | Specifies the location of the solution points used for tensor products. <br> $\bullet$ `1 :=` Legendre-Gauss nodes. <br> $\bullet$ `2 :=` Legendre-Gauss-Lobatto nodes.                                                                                                                                            |
| `invs_flux_method` | `integer`     | `1`           | \\    | Specifies the approximate Riemann solver used to compute the common inviscid fluxes at the interfaces. <br> $\bullet$ `1 :=` Roe flux with entropy fix <br> $\bullet$ `2 :=` HLLC flux <br> $\bullet$ `3 :=` LDFSS flux <br> $\bullet$ `4 :=` Rotated-Roe-HLL flux                                                 |
| `visc_flux_method` | `integer`     | `2`           | \\    | Specifies the method used to compute the common viscous fluxes at the interfaces. <br> $\bullet$ `1 :=` Bassi-Rebay 1 (BR1) (<span style="color:red">WARNING</span>: high chances of stability issues) <br> $\bullet$ `2 :=` Bassi-Rebay 2 (BR2) <br> $\bullet$ `3 :=` Local DG (LDG) (smaller CFL limit than BR2) |
| `limiter_option`   | `integer`     | `0`           | \\    | Limiter option. <br> $\bullet$ `0 :=` No limiter. <br> $\bullet$ `1 :=` Limit by projection using the resolution indicator. <br> $\bullet$ `2 :=` Limit by projection using the jump indicator.                                                                                                                    |

