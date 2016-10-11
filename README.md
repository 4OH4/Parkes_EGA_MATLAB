# Parkes_EGA_MATLAB
MATLAB function for Parkes Error Grid Analysis on blood glucose samples

Rupert Thomas, 2016

For performance assessment of a method of blood glucose concentration
measurement (input_y), against a reference method (input_x)

N.B.: this tool is provided 'as-is', with no warranty. Don't use this for
anything important/clinical without thoroughly double-checking the code
and making sure it does what you expect it to do!

Determines which area of the Parkes error grid the supplied sample data
resides. input_x is a measurement (or vector of measurements) from the 
reference method (comparator, e.g. gold standard), and input_y is a measurement
or vector) from the instrument of interest.

inA... inE are returned as logical vectors identifying if a particular
point is in region A... region E of the Parkes error grid.

By default, the units of glucose concentration are in mg/dl. This is also
the case if a value is not supplied for the input parameter units_mg_dl.
If units_mg_dl is set to false, units of mili-molar (mM) are used
instead.

In the original Parkes paper, the grid coordinates were not
mathematically specified, so the data here has been taken from:
'Technical Aspects of the Parkes Error Grid' - Andreas Pfützner et al., 2013 

Parkes_EGA_boundaries_Type1.m contains the boundary vertices (for the Type 1 grid).
Parkes_EGA_identify.m does the main bit of work identifying which region each point is in.
Parkes_EGA_demo.m show how to call the function, and does a bit of plotting.
