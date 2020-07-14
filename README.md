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
We also have one tool for generating truth table is #Truth Table Genrator
