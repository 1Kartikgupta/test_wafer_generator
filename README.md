# Test_wafer_generator
1. It is used to characterization of standard cells and Test structures.
Here we generate a Test wafer which contains all the standard cells (*.mag) from the StandardCellLib once on the test wafer, but it should have pads (for example L500_TPAD_blank for pads) around each standard cell that are connected to all the ports of the cell, so that each standard cell can be individually tested.
When we connect test pads to the standard cells, one thing should be kept in the mind is about area optimization. 
This Testwafer should contain test structures to evaulate and qualify the technology-depended paramters.
<img src= "">
<img src= "https://github.com/1Kartikgupta/test_wafer_generator/blob/FixForBug/new_AND2x1_with_routing.jpg">
