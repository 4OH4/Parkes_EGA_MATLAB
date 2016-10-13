% Parkes Error Grid Analysis - test and demo
% Rupert Thomas, 2016

% For full description, see Parkes_EGA_identify function

% Run some test data through the Parkes_EGA_identify function, and confirm
% output. Plot test points with grid boundaries.

% N.B.: this is provided 'as-is', with no warranty. Don't use this for
% anything important/clinical without thoroughly double-checking the code
% and making sure it does what you expect it to do!

% Test data: inA, inB1, inB2, inC1, inC2, inD1, inD2, inE, out of range x,
% out of range y, out of range xy, negative x, negative y, negative xy
input_x = [200,200,500,200,450,75,500, 25,600,50,750,-50, 50,-50];  % measurements from the reference instrument
input_y = [200,300,300,500,150,500,100,400,50,600,750,100,-50,-50]; % measurements from the 'new' instrument

units_mg_dl = true; % default units - set false for mM

% Identify which region each point is in
[inA, inB, inC, inD, inE, OOR] = Parkes_EGA_identify(input_x,input_y,units_mg_dl);

% Assert all points in the right place
assert(all(inA == [1,0,0,0,0,0,0,0,0,0,0,0,0,0]));
assert(all(inB == [0,1,1,0,0,0,0,0,0,0,0,0,0,0]));
assert(all(inC == [0,0,0,1,1,0,0,0,0,0,0,0,0,0]));
assert(all(inD == [0,0,0,0,0,1,1,0,0,0,0,0,0,0]));
assert(all(inE == [0,0,0,0,0,0,0,1,0,0,0,0,0,0]));
assert(all(OOR == [0,0,0,0,0,0,0,0,1,1,1,1,1,1]));

disp(['Region A: ', num2str(sum(inA))]);
disp(['Region B: ', num2str(sum(inB))]);
disp(['Region C: ', num2str(sum(inC))]);
disp(['Region D: ', num2str(sum(inD))]);
disp(['Region E: ', num2str(sum(inE))]);
disp(['Out of range: ', num2str(sum(OOR))]);


% Get boundary data
Parkes_EGA_boundaries_Type1;

% Plot boundaries
figure; hold on; grid on; xlim([0,550]); ylim([0,550]);
plot(regionA_x,regionA_y, '-k');
plot(regionB_x,regionB_y, '-r');
plot(regionC_x,regionC_y, '-b');
plot(regionD_x,regionD_y, '-g');
plot(regionE_x,regionE_y, '-c');
xlabel('Glucose result - reference instrument (mg/dl)');
ylabel('Glucose result - instrument under test (mg/dl)');

% Plot points and label
plot(input_x,input_y,'kx');
text(input_x+5,input_y,{'A','B','B','C','C','D','D','E','','','','','',''});