# MiTy
MIcro:bit in uniTY. Framework for using a Microbit within Unity
# Installation
Download or clone the repository. Import `MicroBit.cs` into unity. The folder "Tools" provides tools to aid in the debug process, such as a powershell COM port terminal. The file `MiTy.hex` contains the hex file that should be flashed to the board. Once you've imported `MicroBit.cs` into your unity project, and flashed the hex file, continue to the Implementation section.
# Implementation
Once you have imported `MicroBit.cs` into unity, attach the script to the game object you wish to control. In the inspecter you will have the option to change the COM port and BAUD rate to suite your device and implmentation, although their default settings are most likely correct.

Then, create a second script on your gameobject, where you will include your controller logic. In the attached example, this is `helicopter.cs`.

In your controller script, create a reference to the MicroBit, with a line such as `MicroBit yourVarName =  GetComponent<MicroBit>();`
Finally, use `gameObject.GetComponent(typeof(MicroBit)) as MicroBit`

From here, visit `docs.md` for a more in-depth guide to the MiTy API.

# Notes:
To view the source code for the Micro:bit, visit https://makecode.microbit.org/_g7g9bMLhFTLC
# Bugs, Features and the Future
## Bugs
If you notice any bugs, please log an issue on Github and we will get to you as soon as possible. If you believe you have a fix, feel free to create a new branch with fixes, we will merge code when and where it is appropriate.
## Features and the Future
In the future, we would like to implement several features, including:
- Bluetooth support (coming __very__ soon)
- Radio support
- Additional controller features:
  - Deadzones
  - Trim
  - Moving Compass average
- Pin support (coming __very__ soon)
