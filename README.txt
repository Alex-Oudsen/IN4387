This readme is part of a zip archive containing the mCRL2 model and verification files.
2016 TU Delft IN4387 System Validaton project - Railway crossing

Project group 7
Vincent Koeten	4633393
Vito Kortbeek	4513169
Alex Oudsen	4325494
Lourens Pool	4084861

*****************
*Available files*
*****************
Apart from this readme, the zip archive also contains a folder containing one mcrl2 file and
three additional file folders, a makefile and a testchecker.

Railway_crossing.mcrl2 contains the basic railway crossing model. This is the model that is
described in the report and used during verification of the basic crossing.

The folder Verification_files contains the verification files that correspond to the requirements
listed in chapter 2 of the report. The .mcf files are named and numbered to correspond with the
list presented in the report. Some requirements can be broken down into smaller tests, in which case
there are also files that have a subdivision (a, b, c) behind the number of the corresponding requirement.

The folder Track_Safety contains a smaller model, which contains only the track and safety processes.
Within this folder, there are also models that only consider the track and safety processes respectively.

The folder Lights_Bell_Barriers also contains a smaller model, but this one only contains the lights,
bell and barrier processes. Again, there are also files for just the lights, bell and barrier processes.

To aid the development and verification, the makefile can be used. It converts the main mCRL2 model to 
both the .lps and .lts representations by invoking either 'make' or 'make all'. The created tests can be 
checked against the generated .lps file of the model by invoking 'make tests' command. This will run all 
the tests and show whether each test passed or not by printing true or false respectively.

For extra quick verification of all requirements at once, a shorthand script 'testchecker' is also included.
Running it will still run all tests through the makefile with 'make tests', but will only report a single 
output representing if either all the tests passed, or at least one of them failed.