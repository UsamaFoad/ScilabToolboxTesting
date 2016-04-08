# ScilabToolboxTesting  
### Tester name: Usama A.F. khalil  
### usamafoad@gmail.com  
### Testing ammod function (ammod.sci)  
### Enviroment: OS: Microsoft Windows 8 Pro version 6.2 (Build 9200), scilab-5.5.2 (64-bit)  
#### Also the tests repeated on scilab-5.5.2 online on: [rollApp](https://www.rollapp.com/app/scilab) with the same results.  


 - The indentation of the ammod.sci file is not correct. Off course the function will work irrespectively of its indentation but it is highly recommended that you keep a good indentation that makes it easier to understand the algorithm and spot the error easily.  
 - Also, the function contains comments which give a description of the function did not use the standard keyword ("Calling Sequence", "Parameters", "Description", … etc), using this keywords make it easier to create help file using help_from_sci() function.  

 There are two files inside ammod folder:  
 * ammod_Test_One.sce  
 * ammod_Test_Two.sce  
The first one contain seven tests for dealing with the exception and generating error messages, all test passed except one (case 5) which related to the test for Fs to satisfy Fs>2*(Fc+BW)  
The second file contain three tests to check the three status for ammod function, i.e.,  
*  Y = ammod(x, Fc, Fs)  
*  Y = ammod(x, Fc, Fs, INI_PHASE)  
*  Y = ammod(x, Fc, Fs, INI_PHASE, CARRAMP)  
The first two was passed while the last one was failed due to error in the function lines 47-48 which overwrite the value of carrier amplitude and always make it zero.  

*N.B. Unfortunately, this week my time was very limited so I barely test ammod function only and I did not check the other two functions (deintrlv, modnorm) I can do that latter if the deadline is more flexible.*  