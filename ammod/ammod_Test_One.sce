// Tester name: Usama A.F. Khalil
// usamafoad@gmail.com
// Before run this testes do not forget to execute ammod function in Scilab, ex.
// exec('<Drive Letter><Path to ammod.sci file>\ammod.sci',-1)
// then you can run code for each block/case by selecting it then Ctrl + E
//
// The aim of this test(s) is to check every error message in the ammod function 
// one by one. i.e., I'll create condition to invoke the error message to see if 
// everything go right or not. In some cases I'll do the opposite, i.e., I'll 
// create condition to prevent the error message from execute.

//==========(Case 1)=============================================================
// Test if "if" statement in line 14 work correctly. Number of arguments must be 
// 5 or less. Add 6 inputs (or more) to ammod function, 
// expected results/output: error message "Too many input arguments."
//
// results: Passed
//
fc = 10;
fs = 100;
t = (0:1/fs:10)';
x = sin(2*%pi*t);
ini_phase = 7;
c_amp = 90;
extra_input = [1:9];
test_1 = ammod(x,fc,fs,ini_phase,c_amp,extra_input);

//==========(Case 2)=============================================================
// Test if "if" statement in line 18 work correctly. Signal x must be real. 
// Otherwise we expected error message. Input non real numbers as (x) to ammod 
// function, expected results: error message "X must be real."
//
// results: Passed
// 
fc = 10;
fs = 100;
t = (0:1/fs:10)';
x = sin(2*%pi*t+0*%i);     // complex
xx = sin(sqrt(-1)*%pi*t); // complex
ini_phase = 7;
c_amp = 90;
test_2_1 = ammod(x,fc,fs,ini_phase,c_amp);
test_2_2 = ammod(xx,fc,fs,ini_phase,c_amp);

//==========(Case 3)=============================================================
// Test if "if" statement in line 21 work correctly. Carrier of frequency Fc(Hz) 
// must be (A) real. (B) scalar with length 1 (C) positive. Input Fc as (A) non 
// real (complex) number (B) vector with length > one (C) negative. Expected 
// Results: error message. "Fc must be a real, positive scalar."
//
// results: Passed
// 
fc_A_1 = 10+0*%i;
fc_A_2 = 10 * sqrt(-1);
fc_B = [14:24];
fc_C = -21
fs = 100;
t = (0:1/fs:10)';
x = sin(2*%pi*t);
ini_phase = 7;
c_amp = 90;
// (A)
test_3_A_1 = ammod(x,fc_A_1,fs,ini_phase,c_amp); // complex
test_3_A_2 = ammod(x,fc_A_2,fs,ini_phase,c_amp); // complex
// (B)
test_3_B = ammod(x,fc_B,fs,ini_phase,c_amp); // length > 1
// (C)
test_3_C = ammod(x,fc_B,fs,ini_phase,c_amp); // negative

//==========(Case 4)=============================================================
// Test if "if" statement in line 25 work correctly. Sampling frequency Fs(Hz) 
// must be (A) real. (B) scalar with length 1 (C) positive. Input Fs as (A) non 
// real (complex) number (B) vector with length > one (C) negative. Expected 
// Results: error message. "Fs must be a real, positive scalar."
//
// results: Passed
// 
fc = 10;
fs =100;
fs_A_1 = 100+0*%i;     
fs_A_2 = 100 * sqrt(-1);
fs_B = [14:24];
fs_C = -100;
t = (0:1/fs:10)';
x = sin(2*%pi*t);  
ini_phase = 7;
c_amp = 90;
// (A)
test_4_A_1 = ammod(x,fc,fs_A_1,ini_phase,c_amp); // complex
test_4_A_2 = ammod(x,fc,fs_A_2,ini_phase,c_amp); // complex
// (B)
test_4_B = ammod(x,fc,fs_B,ini_phase,c_amp); // length > 1
// (C)
test_4_B = ammod(x,fc,fs_B,ini_phase,c_amp); // negative

//==========(Case 5)=============================================================
// Line 28, 29 and 30 on ammod.sci file are commented! This "if" statement will 
// never run. If this lines of code not mandatory it is better to remove it 
// completely. Also, the error message is not in constancy with the condition in 
// if statement. In addition, the comment in the beginning of the function (line 9) 
// contradict with that, as it say: Fs must satisfy Fs>2*(Fc+BW). This condition 
// never checked in the function. We have many issues here so; let's resolve 
// these issues step by step. First I'll Uncomment line 28, 29, 30 and test it 
// as it is. The message says that: "Fs must be at least 2*Fc" , I'll satisfy 
// the minimum condition (Fs = 2*Fc) and I expect normal evaluation of the 
// function without any error message.
// 
// results: FAILED
// 
fc = 10;
fs = 2*fc;
t = (0:1/fs:10)';
x = sin(2*%pi*t);
test_5 = ammod(x,fc,fs);  // Non informative error message Fs already equal 2*FC
//
// We have two options to fix this (1) remove the equal sign in if statement, so
// that the error message became right "if (Fs<2*Fc) then", or (2) Update the 
// error message to reveal that Fs must be GREATAR than 2*Fc and off course we 
// have option (3) which is the best to correct both the condition and the error 
// message to be in constancy with the comment in line 9 i.e., "Fs must satisfy 
// Fs>2*(Fc+BW), BW is the bandwidth of x." and as the BW = 2*Fc we can change 
// the condition to be "if Fs <= 6*Fc then"

//==========(Case 6)=============================================================
// Test "Check for initial phase" line 32 to 40
// ini_phase set to zero, If input greater than or equal to 4 and initial value 
// is empty ini_phase remain zero, If ini_phase was complex or has length not 
// equal to one we expect error message "INI_PHASE must be a real scalar."
// For now I'll only check the error message (more test for initial values in 
// the second file ammod_Test_Two.sce). Input initial value as (A) complex (B) 
// length > 1, the expected results: error message "INI_PHASE"  must be a real 
// scalar"
//
// results: Passed
//
fc = 10;
fs = 100;
t = (0:1/fs:10)';
x = sin(2*%pi*t);
ini_phase_A_1 = 5+0*%i; ;
ini_phase_A_2 = 7*sqrt(-1);
ini_phase_B = [14:24];

// (A)
test_6_A_1 = ammod(x,fc,fs,ini_phase_A_1); // complex
test_6_A_2 = ammod(x,fc,fs,ini_phase_A_2); // complex
// (B)
test_6_B = ammod(x,fc,fs,ini_phase_B); // length > 1
//N.B. it is better if the error message refers to that ini_phase length must be 1

//==========(Case 7)=============================================================
// Test "Check for Carrier amplitude" line 42 to 50
// Like in case 6, I'll only test the error message (more test in ammod_Test_Two.sce
// file) If the input equal to five and carr_amp not real or has length not equal 
// to one, we expect error message. Input carr_amp as (A) complex, (B) length > 1, 
// and the expected results: error message "CARRAMP must be a real scalar."
//
// results: Passed
//
fc = 10;
fs = 100;
t = (0:1/fs:10)';
x = sin(2*%pi*t);
ini_phase = 0;
c_amp_A_1 = 90+0*%i;
c_amp_A_2 = 90 * sqrt(-1);
c_amp_B = [14;24];
extra_input = [1:9];
// (A)
test_7_A_1 = ammod(x,fc,fs,ini_phase,c_amp_A_1);
test_7_A_2 = ammod(x,fc,fs,ini_phase,c_amp_A_2);
// (A)
test_7_B = ammod(x,fc,fs,ini_phase,c_amp_B);
