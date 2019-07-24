# Instantation
To instate a Micro:bit object, simply attach `MicroBit.cs` to the GameObject you wish to control. Then, create a second script on that object, where you can interact with the Micro:bit. From that script, gain access to your Micro:bit by calling `GetComponent<MicroBit>();`.

These docs will assume references to the Micro:bit object will be done through the syntax `controller.foo()`. This assumes that you have created a Micro:bit object and referenced it like `MicroBit controller = GetComponent<MicroBit>();`. If you wish to call your variable something else, feel free to do so, but be wary of copy-pasting code.
# Full API
The MiTy framework allows accses to the Micro:Bit through asynchronously updated properties. It also does not track a variable unless specfically asked to. For example, take the accelerometer input. To access the x, y, and z coordinates, you simply need to call `controller.X;`, `controller.Y;`, `controller.Z;`. However, by default the accelerometer is not enabled. To enable the accelerometer, call `controller.UseAccelerometer = true`. If you fail to do this, a `System.ArgumentException` will be thrown, declaring: "Port is not configured to use Accelerometer". Similarly, if you wish to stop using the accelerometer input, call `controller.UseAccelerometer = false`

Currently accsses to the Micro:bit inputs are done using the following syntax

| Input | Use Name | Default state | Data Type | Format | Refrence |
|-------|----------|---------------|-----------|--------|----------|
| Time | UseTime | off | int | [0, ∞) | `controller.Time;` |
| A Button | UseButtons | __on__ | bool | True or False | `controller.A;` |
| B Button | UseButtons | __on__ | bool | True or False | `controller.B;` |
| Compass | UseCompass | off | int | [0, 360] | `controller.Compass;` |
| X-axis | UseAccelerometer | off | int | [-2048, 2048]* | `controller.X;` |
| Y-axis | UseAccelerometer | off | int | [-2048, 2048]* | `controller.Y;` |
| Z-axis | UseAccelerometer | off | int | [-2048, 2048]* | `controller.Z;` |

Pins will be implemented very soon!

\* Note: Accelerometer components are given in milli-Gs, where 1024 mG = 1 G. The accelerometer has a maximum value of ± 2048, even though the actual value may be higher, so 

MiTy creates a thread that will asynchronously update the members of the Micro:bit class. Though the properties are not shown as volatile, they are public interfaces to volatile properties, and are __not__ frame safe.
# Examples
An example script that would spin a Unity Rigidbody when the A button is pressed would look like this:
```
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Top : MonoBehaviour
{
    private Rigidbody rb;
    private MicroBit controller;
 
    void Start()
    {
        this.rb = GetComponent<Rigidbody>();
        this.controller = GetComponent<MicroBit>();
        this.controller.UseButtons = true;
    }
    void FixedUpdate()
    {
        if(this.controller.A)
        {
            this.rb.AddTorque(transform.up * 10f); 
        }
    }
}
```
