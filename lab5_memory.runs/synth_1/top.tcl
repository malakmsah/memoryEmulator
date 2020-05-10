# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 2
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/malak/lab5_memory/lab5_memory.cache/wt [current_project]
set_property parent.project_path /home/malak/lab5_memory/lab5_memory.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo /home/malak/lab5_memory/lab5_memory.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  /home/malak/lab5_memory/lab5_memory.srcs/sources_1/new/d7seg.v
  /home/malak/lab5_memory/lab5_memory.srcs/sources_1/new/decoder3to8.v
  /home/malak/lab5_memory/lab5_memory.srcs/sources_1/new/flipflop.v
  /home/malak/lab5_memory/lab5_memory.srcs/sources_1/new/memory.v
  /home/malak/lab5_memory/lab5_memory.srcs/sources_1/new/mux8to1.v
  /home/malak/lab5_memory/lab5_memory.srcs/sources_1/new/top.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/malak/lab5_memory/lab5_memory.srcs/constrs_1/imports/Downloads/Nexys4DDR_MasterA.xdc
set_property used_in_implementation false [get_files /home/malak/lab5_memory/lab5_memory.srcs/constrs_1/imports/Downloads/Nexys4DDR_MasterA.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
