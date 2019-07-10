# MiTy
MIcrobit in uniTY. Framework for using a Microbit within Unity (or in other c# applications)
# Installation
Download or clone the repository. Import `MicroBit.cs` into unity. The folder "Tools" provides several tools that aid in the debug process, such as a powershell COM port terminal. The Folder "Hex"
# Implementation
## Three Methods
1. ButtonsAndPitch -- Provides the state of the 'A' and 'B' buttons, as well as information from the Microbit Accelerometer
2. ButtonsAndPins -- Provides the state of the 'A' and 'B' buttons, as well as information from each of the analog pins
3. PitchAndPins -- Provides information from the Microbit Accelerometer, as well as information from each of the analog pins

Once you have selected the method you wish to use, flash the Microbit with the hex file. Load the hex file with the appropriate title onto the microbit. More information about that process [here](https://www.google.com "Microbit's Official Guide").

Then, attach the script `MicroBitController.cs` to your desired Unity Game Object. You will see listed in the script the COM port, and BAUD rate, as well as the MODE. If not specficed, COM will default to `COM5`, and BAUD will default to `115200`. If you wish to interface multiple devices, assign different COM ports to each. MODE should be set to one of the three listed above, and must match the hex file on the MicroBit.

Finally, use `gameObject.GetComponent(typeof(MicroBit)) as MicroBit`

Notes:
By default, MiTy creates an additional thread for every MicroBit, to read the Serial line asynchronously. If you wish to run synchronously, which is NOT advised, comment and uncomment the lines in MicroBit.cs as appropriate. Be aware: synchronous serial read will slow down your process signficantly, and will result in virtually no benefits.
