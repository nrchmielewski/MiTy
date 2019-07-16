using System;
using System.IO.Ports;
using System.Threading;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MicroBit : MonoBehaviour
{
    /* #region Static enums */
    public enum CommandType {SETUSE, SETPIXEL, WRITEANALOG, WRITEDIGITAL};
    public enum COMPort {COM1, COM2, COM3, COM4, COM5, COM6, COM7, COM8, COM9};
    /* #endRegion */
}