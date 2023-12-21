This is a helper tool to help you to generate the solutions and compare the output files for TJ1, TJ2, and TJ3.
This is only if you decide to work on your home computer and use VSCode (which I highly recommend)

Table of Contents: 
1. Requirements
2. Initialization
3. Run Tasks
4. Submission Helper 

Files:
tasks.json -> allow us to define tasks to use through VSCode
3x run_tj[x]_default__.ps1 -> powershell commands to automate accepting defaults when running java files 
generate_and_Compare_solutions.sh -> shell command for TJ1 to automate diff checkign for all files 0-15
.vscode -> folder that contains all components above

Requirements: 

	Windows
	VS Code -> IDE 
	Git Bash -> allows us to use Unix-like commands and tools on Windows that translate 1 to 1 to Euclid

Initialization: 
1. Make sure code is in your system path if not, add it -> https://code.visualstudio.com/docs/editor/command-line#_launching-from-command-line
   -- test this by navigating to the root folder of this project in the terminal and typing code .   (this should open the project in VS Code)
   -- note this is needed because we open diff using vscode which is a much nicer and easier to read version of diff than the default one in the terminal
2. Download GitBash and set as default terminal for VSCode Terminal  -> https://code.visualstudio.com/docs/terminal/profiles 
3. SCP download the TJ1/TJ2/TJ3 folders from Euclid to your local machine - follow steps in Prof's docs (just the tj1 if you're only doing tj1, etc)
4. Copy paste this .vscode folder into the root folder of your project (the folder that will contain TJ1asn, TJ2asn, TJ3asn, TJ1solclasses, TJ2solclasses, TJ3solclasses, etc)

Folder Structure Should Look Like This:
	![image](https://github.com/Tshetrim/CSCI316-TinyJ-Helper/assets/49722313/ba710eef-393f-4353-a267-faab74dd1b7a)


Run the tasks in tasks.json to generate the solutions and compare the output files for TJ1, TJ2, and TJ3 
The main ones automatically compile the code, run the program, then compare the output files, you just provide the example file number (0-15)

To run a task:
1. Open the VS Code Command Palette by pressing Ctrl + Shift + P 
2. type Tasks: Run Task 
3. select the task you want to run 
4. press enter

![image](https://github.com/Tshetrim/CSCI316-TinyJ-Helper/assets/49722313/e0ff5664-9030-44df-a8f8-778d324f8f2a)


The Main Tasks you should run are already uncommented in tasks.json and also listed below: 

For TJ1: 
1. Create actual-sol-tj1 and my-sol-tj1 folders in root  -> this is where the output files will be stored when you run the tasks

	- "TJ1 - Generate All Solutions and Compare Output Files"
	- run generate_and_Compare_solutions.sh in the terminal to generate the solutions and compare the output files for all test cases at once (when finished as a final check) 
    
For TJ2: 
1. Create actual-sol-tj2 and my-sol-tj2 folders in root  -> this is where the output files will be stored when you run the tasks

	- "TJ2 Default - Generate All Solutions and Compare Output Files "   <- this one accepts the default options for you using the .ps1 scripts and is the one you should use most of the time
	- "TJ2 - Generate All Solutions and Compare Output Files"
    
For TJ3:
1. Create actual-tj3-log and my-tj3-log folders in root -> this is where the output files will be stored when you run the tasks
2. Create javac-compiled-ex-files in root -> this is where compiled CS316ex[k].java are stored to keep the folder neater (not needed if you will not run TJ3 Java Actual command)
	- "TJ3 - Run a input example"     -> because most of the programs require user input, default accept options are not included 
	- "TJ3 Prof Soln - Compile and Run Java File"    -> runs the prof's solution for the input example you provide
	- "TJ3 DIFF - Compare Output Files"  -> runs diff on the output files 
	- "TJ3 Java Actual - Compile and Run Java File",  -> use as a final check 


*** In the difference files, the left side is your output (.out) and the right side is the expected output (.sol) 
    There is no reason/impact for the different file extensions other then its easier to keep track of which is which ***
![image](https://github.com/Tshetrim/CSCI316-TinyJ-Helper/assets/49722313/bf55c156-8caf-4e84-bdff-17bcdfed31a2)


Some options you can change in tasks.json:: 
-"panel": "new" <- if you want ta new task run to be in a new terminal rather than the same one inside presentation option 


Submission: 

After Uploading relevant file to Euclid, to test in Euclid Terminal:

For TJ1:

    Upload:  scp TJ1asn/Parser.java xxxxx_yyyy316@euclid.cs.qc.cuny.edu:TJ1asn    
    In Euclid Terminal:
        First compile Parser:   javac -cp . TJ1asn/Parser.java
        Then run: k=0; java -cp . TJ1asn.TJ CS316ex$k.java $k.out && java -cp TJ1solclasses:. TJ1asn.TJ CS316ex$k.java $k.sol && diff -c $k.sol $k.out > $k.dif && less $k.dif
        ***Replace k=0 with the example number you want to test (0-15)***
For TJ2: 

    Upload: scp TJasn/ParserAndTranslator.java xxxxx_yyyy316@euclid.cs.qc.cuny.edu:TJasn
    In Euclid Terminal:
        Compile: javac -cp . TJasn/ParserAndTranslator.java
        Run: k=0; java -cp . TJasn.TJ CS316ex$k.java $k.out && java -cp TJsolclasses:. TJasn.TJ CS316ex$k.java $k.sol && diff -c $k.sol $k.out > $k.dif && less $k.dif
        ***Replace k=0 with the example number you want to test (0-15)***
For TJ3:

    Upload: scp TJasn/virtualMachine/*instr.java xxxxx_yyyy316@euclid.cs.qc.cuny.edu:TJasn/virtualMachine
    In Euclid Terminal:
        Compile all instr.java files: javac -cp . TJasn/virtualMachine/*instr.java
        Run: k=0; java -cp . TJasn.TJ CS316ex$k.java $k.out && java -cp TJsolclasses:. TJasn.TJ CS316ex$k.java $k.sol && diff -c $k.sol $k.out > $k.dif && less $k.dif
        ***Replace k=0 with the example number you want to test (0-15)***
        ***The first one is running with your instructions and second is the profs***

