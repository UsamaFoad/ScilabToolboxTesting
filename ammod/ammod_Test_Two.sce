// Tester name: Usama A.F. Khalil
// usamafoad@gmail.com
// Before run this testes do not forget to execute ammod function in Scilab, ex.
// exec('<Drive Letter><Path to ammod.sci file>\ammod.sci',-1)
// then you can run code for each block by selecting it then Ctrl + E
//
// The aim of current test(s) is to check the three status for ammod function, i.e.,
// I) Y = ammod(x, Fc, Fs)
// II) Y = ammod(x, Fc, Fs, INI_PHASE)
// III) Y = ammod(x, Fc, Fs, INI_PHASE, CARRAMP)

//==========(Case I)=============================================================
// I) Y = ammod(x, Fc, Fs)
// Test the amplitude modulation where the modulated signal has zero initial 
// phase and zero carrier amplitude (suppressed-carrier modulation). I'll use 
// the function to calculate the  modulation and compare the results to manual 
// calculation to the same data. The expected result is equality between the 
// results from this two different method - if the function work correctly.
// The data will satisfy that Fs > 2*(Fc+BW)
//
// results: Passed
//
fc = 10;
fs = 100;
t = [0:1/fs:fs/10];
x = sin(2*%pi*t);
y_fun = ammod(x,fc,fs);

x=x(:);
t = (0:1/fs:(size(x,1)-1)/fs)';
t = t(:,ones(1,size(x,2)));
y_man = (0 + x).*cos(2*%pi*fc*t+ 0);
y_man = y_man';

figure
subplot(3,1,1); plot(y_fun);
title('Modulated signal calculated by function');
subplot(3,1,2); plot(y_man);
title('Modulated signal calculated manualy');
subplot(3,1,3); plot(y_fun, 'g'), plot(y_man, 'r') ;
title('Both (only one line will show if they identical)');
if y_fun == y_man then
    disp("Passed");
else
    disp("Failed");
end

//==========(Case II)============================================================
// II) Y = ammod(x, Fc, Fs, INI_PHASE)
// Test the amplitude modulation with initial phase in radians.
// I'll use the function to calculate the modulation and compare the results to: 
//(A) manual calculation to the same data with initial phase 
//(B) manual calculation to the same data WITHOUT specifying initial phase  
// The expected results/output is equality between the results from the function 
// and the first case (A) and difference between the function results and the 
// second case (B). i.e., we need to know if adding the ini_phase to the function 
// make any difference or not.
// The data will satisfy that Fs > 2*(Fc+BW)
//
// results: Passed
//
fc = 10;
fs = 100;
t = [0:1/fs:fs/10];
x = sin(2*%pi*t);
ini_phase = 5;
y_fun = ammod(x,fc,fs,ini_phase);

x=x(:);
t = (0:1/fs:(size(x,1)-1)/fs)';
t = t(:,ones(1,size(x,2)));
//(A) y with ini_phase
y_man_A = (0 + x).*cos(2*%pi*fc*t+ ini_phase);
y_man_A = y_man_A';
//(B) y without ini_phase
y_man_B = (0 + x).*cos(2*%pi*fc*t+ 0);
y_manB = y_man_B';

title_A=["Both Modulated signal y_fun & y_man_A";"(only one line will show if they identical)"];
title_B=["Both Modulated signal y_fun & y_man_B";"(only one line will show if they identical)"];
figure
subplot(3,1,1); plot(y_fun);
title('Modulated signal calculated by function');
subplot(3,1,2); plot(y_fun, 'r'), plot(y_man_A, 'g');
title(title_A);
subplot(3,1,3); plot(y_fun, 'r'), plot(y_man_B, 'g') ;
title(title_B);
if y_fun == y_man_A then
    disp("Passed");
else
    disp("Failed");
end
if y_fun == y_man_B then
    disp("Failed");
else
    disp("Passed");
end

//==========(Case III)===========================================================
// III) Y = ammod(x, Fc, Fs, INI_PHASE, CARRAMP)
// Test the amplitude modulation with initial phase  carrier amplitude 
// (transmitted-carrier modulation) I'll use the function to calculate the 
// modulation and compare the results to: 
//(A) manual calculation to the same data WITH carrier amplitude 
//(B) manual calculation to the same data WITHOUT specifying carrier amplitude 
// The expected results/output is equality between the results from the function 
// and the first case (A) and difference between the function results and the 
// second case (B). i.e., we need to know if adding the CARRAMP to the function 
// make any difference or not.
// The data will satisfy that Fs > 2*(Fc+BW)
//
// results: FAILED
//
fc = 10;
fs = 100;
t = [0:1/fs:fs/10];
x = sin(2*%pi*t);
ini_phase = 5;
carr_amp = 9;
y_fun = ammod(x,fc,fs,ini_phase, carr_amp);

x=x(:);
t = (0:1/fs:(size(x,1)-1)/fs)';
t = t(:,ones(1,size(x,2)));
//(A) y with carr_amp
y_man_A = (carr_amp + x).*cos(2*%pi*fc*t+ ini_phase);
y_man_A = y_man_A';
//(B) y without carr_amp
y_man_B = (0 + x).*cos(2*%pi*fc*t+ ini_phase);
y_manB = y_man_B';

title_A=["Both Modulated signal y_fun & y_man_A";"(only one line will show if they identical)"];
title_B=["Both Modulated signal y_fun & y_man_B";"(only one line will show if they identical)"];
figure
subplot(3,1,1); plot(y_fun);
title('Modulated signal calculated by function');
subplot(3,1,2); plot(y_fun, 'g'), plot(y_man_A, 'r');
title(title_A);
subplot(3,1,3); plot(y_fun, 'r'), plot(y_man_B, 'g') ;
title(title_B);
if y_fun == y_man_A then
    disp("Passed");
else
    disp("Failed");
end
if y_fun == y_man_B then
    disp("Failed");
else
    disp("Passed");
end
// The results show that the function always ignore carrier amplitude value and 
// consider it as zero. The reason for this is the 'else' statemnt in lines 47-48
// this allows evaluate to true and set carr_amp=0!
