# DeTopS
Descriptive Topological Spaces
DeTopS.cu
Descriptive Topological Space

Current version: 
	Release: 1.1
	Mar 15, 2019
	
Complete Documentation can be found in DeTopS_documentation.txt
	
Description:
	This project takes in multiple files consisting of sets of numeric data representing vectors and 
	performs all combinations of intersections between the sets. In addition to this,
	a measure of the nearness of sets will be calculated and displayed.
	The end result is a Descriptive Topological Space (DeTops).
	
Copyright and Licensing:
	
	Copyright (c) 2016, Jesse Harder

	Permission is hereby granted, free of charge, to any person obtaining 
	a copy of this software and associated documentation files (the "Software"), 
	to deal in the Software without restriction, including without limitation 
	the rights to use, copy, modify, merge, publish, distribute, sublicense, 
	and/or sell copies of the Software, and to permit persons to whom the Software 
	is furnished to do so, subject to the following conditions:

		The above copyright notice and this permission notice shall be 
		included in all copies or substantial portions of the Software.

		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
		FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
		AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
		WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
		CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	
Libraries:	
	iostream: Defines standard input/output objects
	fstream: Class used for reading in, and outputing to files
	vector: Defines vector object for storing flexible sized arrays of data
	math.h: Provides a number of mathematical functions: pow, log, ceil, and floor in particular are used
	stdlib.h: Defines a number of variable types. size_t in particular is used
	string: Provides access to the string object, representing an array of characters
	sstream: Provides methods for working with strings
	limits: Provides access to max and min functions
	ctime: Allows for timing of code
	pthread.h: Provides access to pthread, used for multithreaded CPU code
	mutex: Provides mutex class, used for synchronization of multithreaded code
	
Set up and operation:
	Requirements:
		Compute Capability 3.0 or higher GPU device
    To compile:
		Requires use of Nvidia's CUDA Compiler: NVCC
			http://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/#axzz4FS98r9VS
        Go to file directory containing DeTopS.cu and type command:
		nvcc -arch=sm_35 -rdc=true DeTopS.cu -o executableName -lcudadevrt -std=c++11
			
	Running:
		Command Line Parameters:
		-b [int > 0]: Specifies how many bins to discretize into, if discretizing
		
		-c: Instructs program to run all intersections on the CPU
		
		-cg: Instructs program to run all intersections on GPU, then again on CPU (used for testing)
		
		-cores [int >0]: Specifies how many cores to run parallel CPU code on
		
		-d: Instructs program to discretize the input data (Default: 3 bins)
	
		-do: Instructs program to used discretized data for output, instead of original values
	
		-f [file0 file1 ... fileN]: Manually list all input files to use !!Must be last parameter!!
		
		-fd [int > 0] [file0] [file1]: Specifies to read in X files from exactly 2 file locations, file0 and file1
			Note: file0 and file1 must be two complete paths to file names.
				Eg: To read from Files/example0.txt, file0 would be Files/example
				This parameter reads example0.txt to example(X/2).txt for file0 and file1
				
		-gpu [int >= 0]: Specify which device to run GPU segments on. Requires a valid device id
			
		-help: Prints out available command line parameters, then exits program
			
		-md [int > 0]: Specifies maximum depth of intersections to perform. (Default = number of input sets)
	
		-mt: Instructs code to perform check to see if sets to be intersected are empty or not
			Prevents the performing of unnecessary intersections, but may slow down code for certain data sets
	
		-o [int > 0]: MANDATORY!! Specifies the number of features per feature vector
		
		-t: Instructs program to time the code, and print results of the timing
		
		-v: Instructs program to print verbose information while running
			This includes:
				GPU specifications
				Results of individual set measures
		
	Input Files:
		This program will take in as many text files as it can handle in memory as input.
		These files must adhere to the following rules:
			-Each input file is made up of real number values (Program will read them as floats)
			-Each input file is of the same dimensions as all other input files
			-Each file is laid out so that features of a feature vector are in order and adjecent
				to eachother in the file
				
				For example, for feature vectors made up of some features, X Y Z, the file should look like
					X0 Y0 Z0 X1 Y1 Z1 ... XN YN ZN  (Where N is the number of feature vectors)
				As opposed to:
					X0 X1 ... XN Y0 Y1 ... YN Z0 Z1 ... ZN
		
		The output file produced by the program will follow the same format		
		
	
Known Bugs and Limitations:
	The maximum amount of input sets/files is 64.
	Number of sets may be limited by GPU memory size.
	Very large numbers of features per feature vector may cause GPU algorithm to slow down
	
Troubleshooting:
	Ensure GPU device being used has proper compute capability (CC).
		This program uses Unified Memory, requiring CC 3.0 or above
	

Contact:
	(Programmer) Jesse L Harder, harder-j30@webmail.uwinnipeg.ca
	
Acknowledgements:
	Supervisor: Dr. Christopher Henry, P. Eng.
		
	This research has been supported by the 
	Natural Sciences and Engineering Research Council of Canada (NSERC) grant 418413 
	and the Tesla K40 used in this research was donated by the NVIDIA Corporation
	
	http://graphics.stanford.edu/~seander/bithacks.html
		For certain bit hacking operations used
	
		
	
