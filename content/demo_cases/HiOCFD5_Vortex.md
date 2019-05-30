---
title: "HiOCFD5 Vortex Transport"
type: "post"
weight: 2
lastmod: "2019-05-30"
---

# Case Description

This case is from [the 5th International Workshop on High Order CFD Methods](https://how5.cenaero.be). Check its description from this [webpage](https://how5.cenaero.be/content/vi1-vortex-transport-uniform-flow).

This basic case is aimed at testing a high-order method’s capability to preserve vorticity in an unsteady inviscid flow.

# Results

NFS employs SSP-RK3 as the time marching scheme. Although the original case document targets 50 periods of time to test the accuracy, here we target $1.5 \times 10^{-4}s$ for the comparison. In fact, a long time run shows that the accuracy is kept really well after 50 periods of time. The $L_2$ error is in terms of the streamwise velocity.

Using 3 grids under P3 and P4, NFS shows the following orders of accuracy.

![Error VS. Grid size](demo_cases/HiOCFD5_Vortex/error_h.png)

