#!/bin/env tclsh


set hosts [glob -type f stdcelllib_files/*.mag]
set listabc $hosts
set length [llength $listabc]
puts "$listabc"

## Adding pads with Standard cell ##

for {set i 0} { $i < $length } {incr i} {
	set fp [open [lindex $listabc $i] r]
	set lines [ split [read $fp] "\n"]
set lines [lreplace $lines end-1 end-1 "use pad  pad_0"]
set lines [lreplace $lines end end "timestamp 1"]
set lines [lreplace $lines end+1 end+1 "transform 1 0 -153 0 1 85"]
set lines [lreplace $lines end+1 end+1 "box 10 10 110 110"]
set lines [lreplace $lines end+1 end+1 "use pad  pad_1"]
set lines [lreplace $lines end+1 end+1 "timestamp 1"]
set lines [lreplace $lines end+1 end+1 "transform 1 0 94 0 1 85"]
set lines [lreplace $lines end+1 end+1 "box 10 10 110 110"]
set lines [lreplace $lines end+1 end+1 "use pad  pad_3"]
set lines [lreplace $lines end+1 end+1 "timestamp 1"]
set lines [lreplace $lines end+1 end+1 "transform 1 0 -150 0 1 -135"]
set lines [lreplace $lines end+1 end+1 "box 10 10 110 110"]
set lines [lreplace $lines end+1 end+1 "use pad  pad_4"]
set lines [lreplace $lines end+1 end+1 "timestamp 1"]
set lines [lreplace $lines end+1 end+1 "transform 1 0 -396 0 1 85"]
set lines [lreplace $lines end+1 end+1 "box 10 10 110 110"]
set lines [lreplace $lines end+1 end+1 "use pad  pad_5"]
set lines [lreplace $lines end+1 end+1 "timestamp 1"]
set lines [lreplace $lines end+1 end+1 "transform 1 0 338 0 1 85"]
set lines [lreplace $lines end+1 end+1 "box 10 10 110 110"]
set lines [lreplace $lines end+1 end+1 "use pad  pad_2"]
set lines [lreplace $lines end+1 end+1 "timestamp 1"]
set lines [lreplace $lines end+1 end+1 "transform 1 0 93 0 1 -135"]
set lines [lreplace $lines end+1 end+1 "box 10 10 110 110"]
set lines [lreplace $lines end+1 end "<< end >>"]
	set fp2 [open [lindex $listabc $i] r+]
puts $fp2 [join $lines "\n"]
close $fp2
}

set flist "$listabc"
file copy {*}$flist [file join stdcells_with_pads]
set host [glob -type f stdcells_with_pads/*.mag] 
set listcba [llength $host]
puts $listcba
