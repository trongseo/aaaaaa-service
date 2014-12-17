using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Logs
/// </summary>
public class Logs
{

    NLog.Logger _logger = NLog.LogManager.GetCurrentClassLogger();
    public Logs()
    {
    }

    [System.Runtime.CompilerServices.MethodImpl(
System.Runtime.CompilerServices.MethodImplOptions.NoInlining)]
    public void Info(string strInfo)
    {
        var callingMethod = new System.Diagnostics.StackTrace(1, false).GetFrame(0).GetMethod();
        string methodName = callingMethod.Name;
        string className = callingMethod.DeclaringType.ToString();

        _logger.Info(className + "|" + methodName + System.Environment.NewLine + strInfo);
    }
    [System.Runtime.CompilerServices.MethodImpl(
System.Runtime.CompilerServices.MethodImplOptions.NoInlining)]
    public void Debug(string strDebug)
    {
        var callingMethod = new System.Diagnostics.StackTrace(1, false).GetFrame(0).GetMethod();
        string methodName = callingMethod.Name;
        string className = callingMethod.DeclaringType.ToString();

        _logger.Debug(className + "|" + methodName + System.Environment.NewLine + strDebug);
    }

}