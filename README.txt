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
Apart from this readme, the zip archive also contains a folder, Verified_model, containing
all mcrl2 files and verification tests in .mcf format used in the project.
Also, a makefile and a testchecker have been supplied.

Railway_crossing.mcrl2 contains the basic railway crossing model. This is the model that is
described in the report and used during verification of the basic crossing. In addition to this file,
a _nohide version is also supplied, which does not hide any internal actions, thus allowing verification
tests access to these internal actions. This is used to check for present trains, which is of course
something that is externally observable, but can only be 'measured' by the system by means of sensors.

The folder Verification_files contains the verification files that correspond to the requirements
listed in chapter 2 of the report. The .mcf files are named and numbered to correspond with the
list presented in the report. Some requirements can be broken down into smaller tests, in which case
there are also files that have a subdivision (a, b, c) behind the number of the corresponding requirement.

The folder Track_Safety contains a smaller model, which contains only the track and safety processes.
Within this folder, there are also models that only consider the track and safety processes respectively.

The folder Lights_Bell_Barriers also contains a smaller model, but this one only contains the lights,
bell and barrier processes. Again, there are also files for just the lights, bell and barrier processes.

Apart from the basic model, three additional models have been supplied. The _dead model is the basic model,
from which all communication between processes has been removed. The _unsafe model is the exact opposite,
allowing all actions in any state. These two models are used to proof that the verification tests do not
hold under all circumstances. Finally, the _extended model is the basic model with the extensions described
in the report added to it. Within the Verification_files folder, there is a separate folder with
verification tests for this extended model.

To aid the development and verification, the makefile can be used. It converts the main mCRL2 model to 
both the .lps and .lts representations by invoking either 'make' or 'make all'. The verification tests can be 
checked against the generated .lps file of the model by invoking the 'make tests' command. This will run all 
the tests and show whether each test passed or not by printing true or false respectively.

For extra quick verification of all requirements at once, a shorthand script 'testchecker' is also included.
Running it will run all tests on all versions of the model on a model of the users choice. It still uses
the makefile with 'make tests', but will only report a single output representing if either all the tests passed,
or at least one of them failed.