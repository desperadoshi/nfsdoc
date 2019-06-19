---
title: HiOCFD5 Vortex Transport
author: Jingchang Shi
date: 2019-05-30, 10:22:33
---

# Case Description

This case is from [the 5th International Workshop on High Order CFD Methods](https://how5.cenaero.be). Check its description from this [webpage](https://how5.cenaero.be/content/vi1-vortex-transport-uniform-flow).

This basic case is aimed at testing a high-order method’s capability to preserve vorticity in an unsteady inviscid flow.

# Results

NFS employs SSP-RK3 as the time marching scheme. It runs 25 periods of time to test the accuracy. The $L_2$ error is in terms of the streamwise velocity.

Using 3 grids under P3 and P4, NFS shows the following orders of accuracy.

![Error VS. Grid size](demo_cases/HiOCFD5_Vortex/error_h.png)

