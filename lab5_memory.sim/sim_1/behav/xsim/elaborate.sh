#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Sun May 10 22:36:23 EEST 2020
# SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 06ab8d7ced254f608593cf99ff81c8a6 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot top_tb_behav xil_defaultlib.top_tb xil_defaultlib.glbl -log elaborate.log"
xelab -wto 06ab8d7ced254f608593cf99ff81c8a6 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot top_tb_behav xil_defaultlib.top_tb xil_defaultlib.glbl -log elaborate.log

