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

## Following command is used to see these files

type this command on terminal:-
```
magic filename.mag -T filename_of_tech_file.tech
```

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
Checkpoint: type ```python3```for python, enter command ```z3 --help``` for z3 solver Give command ```ngspice``` for ngspice

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

# Installing Librecell

### Getting started
LibreCell can be installed using the Python package manager `pip` or directly from the git repository.

#### Dependencies
The following dependencies must be installed manually:
* python3
* ngspice http://ngspice.sourceforge.net/ : SPICE simulator used for cell characterization.
* z3 https://github.com/Z3Prover/z3 : SMT solver.

Optional dependencies (not required for default configuration):
* GLPK https://www.gnu.org/software/glpk : ILP/MIP solver

Depending on your linux distribution this packages can be installed using the package manager.

Example for Arch Linux:
```sh
sudo pacman -S python ngspice z3
```

#### Installing with pip

It is recommended to use a Python 'virtual environment' for installing all Python dependencies:
```sh
# Create a new virtual environment
python3 -m venv my-librecell-env
# Activate the virtual environment
source ./my-librecell-env/bin/activate

pip3 install librecell
```

#### Installing from git
It is recommended to use a Python 'virtual environment' for installing all Python dependencies:
```sh
# Create a new virtual environment
python3 -m venv my-librecell-env
# Activate the virtual environment
source ./my-librecell-env/bin/activate
```

Install from git:
```sh
git clone https://codeberg.org/tok/librecell.git
cd librecell

# Install librecell-common
cd librecell-common
python3 setup.py develop
cd ..

# Install lclayout
cd librecell-layout
python3 setup.py develop
cd ..

# Install lclib
cd librecell-lib
python3 setup.py develop
cd ..
```

Now, check if the command-line scripts are in the current search path:
```sh
lclayout --help
```
If this shows the documentation of the `lclayout` command, then things are fine. Otherwise, the `PATH` environment variable needs to be updated to include `$HOME/.local/bin`.

```sh
# Instead of executing this line each time it can be added to ~/.bashrc
export PATH=$PATH:$HOME/.local/bin
```

#### Generate a layout
Generate a layout from a SPICE netlist which includes the transistor sizes.
```sh
cd librecell-layout
mkdir /tmp/mylibrary
lclayout --output-dir /tmp/mylibrary --tech examples/dummy_tech.py --netlist examples/cells.sp --cell AOI2X1
# Use a GDS viewer such as KLayout to inspect the generated layout file `/tmp/mylibrary/*.gds`
```

## Usage of Librecell

LibreCell is a toolbox for automated synthesis of CMOS logic cells.

LibreCell is structured in multiple sub-projects:
* [librecell-layout](librecell-layout): Automated layout generator for CMOS standard cells.
* [librecell-lib](librecell-lib): Characterization kit for CMOS cells and tool for handling liberty files.
* [librecell-common](librecell-common): Code that is used across different LibreCell projects such as a netlist parser.
* [librecell-meta](librecell-meta): Convinience Python package for easier installation.

## If you want know more about this project then read following document

https://github.com/1Kartikgupta/test_wafer_generator/blob/FixForBug/Test_wafer_generator.pdf

## Contact Details

 - Kartik Gupta, ABV-IIITM,Gwalior, guptakartik279@gmail.com
 - Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com
 - Philipp Gühring, Software Architect, LibreSilicon Assocation pg@futureware.at
 - Dr. Gaurav Trivedi Co-Principal Investigator, EICT Academy, IIT Guwahati trivedi@iitg.ac.in 
