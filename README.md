# Test_wafer_generator
1. It is used to characterization of standard cells and Test structures.
Here we generate a Test wafer which contains all the standard cells (*.mag) from the StandardCellLib once on the test wafer, but it should have pads (for example L500_TPAD_blank for pads) around each standard cell that are connected to all the ports of the cell, so that each standard cell can be individually tested.
When we connect test pads to the standard cells, one thing should be kept in the mind is about area optimization. 
This Testwafer should contain test structures to evaulate and qualify the technology-depended paramters.
<img src= "https://github.com/1Kartikgupta/test_wafer_generator/blob/FixForBug/standard_cell_without_pads%20.jpg">
<img src= "https://github.com/1Kartikgupta/test_wafer_generator/blob/FixForBug/stdcell_with_pad.jpg">
<img src= "https://github.com/1Kartikgupta/test_wafer_generator/blob/FixForBug/new_AND2x1_with_routing.jpg">

These above images shows that how we going to test the cells.

2. Like the above images we will collect all the test cells on the Die, so that we can test each of them with wafer probing machine. 
3. We use Automatic Test Pattern Generation technique for testing the test cells. 
The Atpg tool is an electronic design automation method/technology which is used to find an input or test sequence that when applied to a wafer containing a circuit, enables automatic test equipment (ATE)  to distinguish between the correct circuit behavior and the errors caused by the defects present in wafer. This used for failure analysis which is used to test semiconductor devices after manufacture or to assist with determining the cause of failure. By the number of modeled defects or fault models which is detectable by the number of generated pattern the effectiveness of ATPG can be measured.
We also have one tool for generating truth table is "Truth Table Genrator" given by Librecell.

# Installing the Magic tool

Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow. 

## Installation steps of Magic in Linux

1. Download magic-8.1.222.tgz
2. Go to Downloads folder
3. Right-click on magic-8.1.222.tgz → Extract here
4. Open magic-8.1.222(folder)
5. Right click → Open in Terminal (or open terminal and write cd Downloads/magic-8.1.222.tgz
and press enter)
6. sudo ./configure (enter your password)
7. sudo make
8. sudo make install
9. Go to http://opencircuitdesign.com/magic/ and read Standard Tutorial Set for further instructions.

## Installation steps of Python3, Ngspice, Z3 Solver in Linux

To install python 3 the command is 
```
sudo apt-get install python3
```
Commands to install Ngspice and Z3
```
sudo apt-get install ngspice 
sudo apt-get install z3
```
We will require MAGIC software to read the ```.mag``` files
```
sudo apt-get install magic
```
To check whether all the tools are installed : try for checkpoints
Checkpoint 1: type ```python3```for python, enter command ```z3 --help``` for z3 solver Give command ```ngspice``` for ngspice

Now we need to work on thr python working environment
use the foloowing commands for setting up your python virtual environment
```
sudo apt-get install python3-venv
```
```
python3 -m venv my-librecell-env
```
```
source ./my-librecell-env/bin/activate
```

## Installing Librecell
WE will install libre cell from git so use the following command to download and install
```
git clone https://codeberg.org/tok/librecell.git
cd librecell
```
```
cd librecell-common
python3 setup.py develop
cd ..
```
```
cd librecell-layout
python3 setup.py develop
cd ..
```
```
cd librecell-lib
python3 setup.py develop
cd ..
```
To make sure that the libre cell is installed properly typre the foloowing command
```
lclayout --h
```
If terminal is showing information or help commands then librecell is installed.

Next we need to deal with actual files that is spice netlist files, tech files, directories,etc. We need to make directory in lbrecell layout folder. Make sure that you are in librecell folder right now [From librecell folder we will go to librecell-layout]
```
cd librecell-layout
```
So make a directory
```
mkdir /tmp/mylibrary
```
