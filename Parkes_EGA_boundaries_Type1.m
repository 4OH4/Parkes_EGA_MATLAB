% Boundary vertices for Parkes Error Grid Analysis
% (Type 1 diabetes and regulatory use)

% Rupert Thomas, 2016

% N.B.: this data is provided 'as-is', with no warranty. Don't use this for
% anything important/clinical without thoroughly double-checking the code
% and making sure it does what you expect it to do!

% Source:
% 'Technical Aspects of the Parkes Error Grid' - Andreas Pfützner et al., 2013 

% Region A
regionA_x = [0,50,50,170,385,550,550,430,280,140,30,0];
regionA_y = [0,0, 30,145,300,450,550,550,380,170,50,50];

% Region B
regionB_x = [0,120, 120,260,550,550,260, 70,50,30, 0];
regionB_y = [0,  0,  30,130,250,550,550,110,80,60,60];

% Region C
regionC_x = [0,250, 250,550,550,125, 80, 50, 25,  0];
regionC_y = [0,  0,  40,150,550,550,215,125,100,100];

% Region D
regionD_x = [0,550,550,50,  35,  0];
regionD_y = [0,  0,550,550,155,150];

% Region E - everything else in range
regionE_x = [0,  0,550,550];
regionE_y = [0,550,550,  0];