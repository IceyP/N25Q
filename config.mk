NITRO_PARTS_DIR = ../..

# INC_PATHS specifies a space separated list of paths to the files
# that are `included in any of the verilog source files.  See also
# the SIM_LIBS variable.
INC_PATHS = rtl_auto \
            $(NITRO_PARTS_DIR)/Micron/N25Q/sim/N25Q256A73E_VG12 \
	    $(NITRO_PARTS_DIR)/lib/xilinx \

# INC_FILES specifies a list of files that are included in the verilog
# and are thus dependancies of the simulation.  It is not strictly
# necessary to list all of them here, but you can list any here
# that you want to use trigger a verilator rebuild or that need
# auto generated themselves.
INC_FILES = config.mk \

# SIM_FILES is a list of simulation files that are common to all
# simulations.  Use the VERILATOR_FILES, IVERILOG_FILES, etc.
# variables to specify simulator specific files
SIM_FILES = \
	sim/tb.v \
	$(NITRO_PARTS_DIR)/lib/HostInterface/models/fx3.v \
	$(NITRO_PARTS_DIR)/Micron/N25Q/sim/N25Q_sim.v \
	$(NITRO_PARTS_DIR)/Micron/N25Q/sim/N25Q256A73E_VG12/code/N25Qxxx.v \

IVERILOG_FILES = sim/iverilog_tests.v


# VERILATOR specific options
#VERILATOR_ARGS=-Wno-UNOPTFLAT
VERILATOR_ARGS=
VERILATOR_FILES=

# ISE_SIM specific options
ISE_SIM_ARGS = isim_tests -L unisims_ver -L secureip
ISE_SIM_FILES = sim/isim_tests.v

VSIM_TOP_MODULE = isim_tests
VSIM_SIM_FILES = sim/isim_tests.v
SIM_TOP_MODULE = tb

# SIM_DEFS specifies and `defines you want to set from the command
# line
SIM_DEFS += TRACE

# SIM_LIBS specifies the directories for any verilog libraries whose
# files you want to auto include.  This should not be confused with
# the INC_PATHS variable.  SIM_LIBS paths are searched for modules
# that are not excility listed in the SIM_FILES or SYN_FILES list
# whereas INC_PATHS are searched for files that are `included in the
# verilog itself.
SIM_LIBS=$(NITRO_PARTS_DIR)/../lib/xilinx secureip

# SYN_FILES lists the files that will be synthesized
SYN_FILES = \
	rtl/N25Q_hs.v \
	$(NITRO_PARTS_DIR)/lib/spi/spi_master.v \
	rtl_auto/N25Q_CTRLTerminal.v \
        $(NITRO_PARTS_DIR)/lib/HostInterface/rtl/Fx3HostInterface.v \

# CUSTOM targets should go here

# DI_FILE is used by the di.mk file
DI_FILE = terminals.py
# include di.mk to auto build the di files
include ../../../lib/Makefiles/di.mk

