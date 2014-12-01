This project is all about familiarising with Verilog, the Hardware Description Language.

Compiler used: *Icarus Verilog*

GUI used for simulation: *GTKWave*

The build instructions will be updated shortly.
This was developed in Windows 8, 64-bit machine.

#Build Instructions

- Download the Icarus Verilog software from the original sote. It is completely open source under the GNU License.

- Go to the working directory and type the following command in DOS as a batch file.     ```iverilog -o file_name file_name.v```


- Then, type ```vvp file_name```

- Then, type ```GTKWave``` and follow the usual pratice of running the simulation.

#Verilog Tips
1. Within the begin block, the variables to be updated towards the RHS will remain the same till the entire begin is executed. That is, to say, the entire begin block is interpreted as a whole.

2. '#' marks within the tester module depict the number of seconds given as gap till the next input instruction.

3. ```begin``` and ```end``` denote the beginning and the end of structures, much like ```{}``` in any other programming language.

4. The ```begin``` and ```end``` are not required if the structure block consists of only one line of code.


