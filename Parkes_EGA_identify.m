function [inA, inB, inC, inD, inE, OOR] = Parkes_EGA_identify(input_x,input_y,units_mg_dl)
% Parkes Error Grid Analysis
% Rupert Thomas, 2016
%
% For performance assessment of a method of blood glucose concentration
% measurement (input_y), against a reference method (input_x)
%
% N.B.: this tool is provided 'as-is', with no warranty. Don't use this for
% anything important/clinical without thoroughly double-checking the code
% and making sure it does what you expect it to do!
%
% Determines which area of the Parkes error grid the supplied sample data
% resides. input_x is a measurement (or vector of measurements) from the 
% reference method (comparator, e.g. gold standard), and input_y is a measurement
% or vector) from the instrument of interest.
%
% inA... inE are returned as logical vectors identifying if a particular
% point is in region A... region E of the Parkes error grid.
%
% By default, the units of glucose concentration are in mg/dl. This is also
% the case if a value is not supplied for the input parameter units_mg_dl.
% If units_mg_dl is set to false, units of mili-molar (mM) are used
% instead.
%
% In the original Parkes paper, the grid coordinates were not
% mathematically specified, so the data here has been taken from:
% 'Technical Aspects of the Parkes Error Grid' - Andreas Pfützner et al., 2013 

% If no parameter supplied, assume mg_dl
if ~exist('units_mg_dl','var')
    units_mg_dl = true;
end

assert(islogical(units_mg_dl) || isnumeric(units_mg_dl));

% Get boundary data - for Type 1
Parkes_EGA_boundaries_Type1;

% Convert boundary data to mM if required
if ~units_mg_dl
    regionA_x = regionA_x * 0.05556;
    regionA_y = regionA_y * 0.05556;
    regionB_x = regionB_x * 0.05556;
    regionB_y = regionB_y * 0.05556;
    regionC_x = regionC_x * 0.05556;
    regionC_y = regionC_y * 0.05556;
    regionD_x = regionD_x * 0.05556;
    regionD_y = regionD_y * 0.05556;
    regionE_x = regionE_x * 0.05556;
    regionE_y = regionE_y * 0.05556;
end

% Find points inside each polygon - including overlap
inA = inpolygon(input_x,input_y,regionA_x,regionA_y);
inB = inpolygon(input_x,input_y,regionB_x,regionB_y);
inC = inpolygon(input_x,input_y,regionC_x,regionC_y);
inD = inpolygon(input_x,input_y,regionD_x,regionD_y);
inE = inpolygon(input_x,input_y,regionE_x,regionE_y);

% Remove overlap - have to do this backwards!
inE = inE & ~inD;
inD = inD & ~inC;
inC = inC & ~inB;
inB = inB & ~inA;

% Generate vector of out of range values
OOR = ~(inA | inB | inC | inD | inE);

end