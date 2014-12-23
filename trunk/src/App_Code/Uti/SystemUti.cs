﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Globalization;
using System.Web.UI;

/// <summary>
/// Summary description for MyLange
/// </summary>
public class SystemUti
{

    public SystemUti()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void Show(string message, string scriptnext)
    {
        // Cleans the message to allow single quotation marks
        string cleanMessage = message.Replace("'", "\\'");
        string script = "<script type=\"text/javascript\">alert('" + cleanMessage + "');" + scriptnext + "</script>";

        // Gets the executing web page
        Page page = HttpContext.Current.CurrentHandler as Page;

        // Checks if the handler is a Page and that the script isn't allready on the Page
        if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
        {
            page.ClientScript.RegisterClientScriptBlock(typeof(MyUtilities), "alert", script);
        }
    }
    public static void ShowAndGo(string message, string url1)
    {
        // Cleans the message to allow single quotation marks
        string cleanMessage = message.Replace("'", "\\'");
        string script = "<script type=\"text/javascript\">alert('" + cleanMessage + "');window.location.href='" + url1 + "'</script>";

        // Gets the executing web page
        Page page = HttpContext.Current.CurrentHandler as Page;

        // Checks if the handler is a Page and that the script isn't allready on the Page
        if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
        {
            page.ClientScript.RegisterClientScriptBlock(typeof(MyUtilities), "alert", script);
        }
    }
    public static void ShowConfirm(string message, string scriptrue, string scriptfalse)
    {
        // Cleans the message to allow single quotation marks
        string cleanMessage = message.Replace("'", "\\'");

        string script = "<script type=\"text/javascript\">if (  confirm('" + message + "')) {" + scriptrue + "}else{" + scriptfalse + "};</script>";

        // Gets the executing web page
        Page page = HttpContext.Current.CurrentHandler as Page;

        // Checks if the handler is a Page and that the script isn't allready on the Page
        if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("confirm"))
        {
            page.ClientScript.RegisterClientScriptBlock(typeof(MyUtilities), "confirm", script);
        }
    }

    /// <summary>
    /// Write javascript
    /// </summary>
    /// <param name="scriptnext"></param>
    public static void ShowScipt(string scriptnext)
    {
        // Cleans the message to allow single quotation marks
        string cleanMessage = "";
        string script = "<script type=\"text/javascript\">" + scriptnext + "</script>";

        // Gets the executing web page
        Page page = HttpContext.Current.CurrentHandler as Page;

        // Checks if the handler is a Page and that the script isn't allready on the Page
        if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
        {
            page.ClientScript.RegisterClientScriptBlock(typeof(MyUtilities), "alert", script);
        }
    }
    public static string shortText(object message1, int lengx)
    {
        string textre = message1.ToString();
        if (textre.Length < lengx) return textre;
        textre = textre.Substring(0, lengx);
        return textre+"...";
    }
    public static void Show(string message)
    {
        // Cleans the message to allow single quotation marks
        string cleanMessage = message.Replace("'", "\\'");
        string script = "<script type=\"text/javascript\">alert('" + cleanMessage + "');</script>";

        // Gets the executing web page
        Page page = HttpContext.Current.CurrentHandler as Page;

        // Checks if the handler is a Page and that the script isn't allready on the Page
        if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
        {
            page.ClientScript.RegisterClientScriptBlock(typeof(MyUtilities), "alert", script);
        }
    }

    public static string getQuery(string keyRequest)
    {
        if (HttpContext.Current.Request[keyRequest] != null)
            return HttpContext.Current.Request[keyRequest].ToString();
        return string.Empty;
    }
    public static string ConverDDMMYYYYtoYYYYMMDD(object Date)
    {
        string date1 = Date.ToString();
        string[] sdate = date1.Split("-".ToCharArray());
        string dd = sdate[0];
        string mm = sdate[1];
        string yy = sdate[2];
        return yy + "-" + mm + "-" + dd;

    }
    /// <summary>
    /// , REPLACE(CONVERT(varchar(20), (CAST(([giathanh]) AS money)), 1), '.00', '')
    /// </summary>
    /// <param name="valueNumber"></param>
    /// <returns></returns>
    public static string formatNumber(object valueNumber)
    {
        try
        {
            double myDouble = double.Parse(valueNumber.ToString());
            return myDouble.ToString("#,#", CultureInfo.InvariantCulture);
        }
        catch (Exception ex)
        {
            Logs logger = new Logs();
            logger.Debug(ex.ToString());
            return "0";
        }
    }
    /// <summary>
    /// tra ve dd-MM-yyyy
    /// </summary>
    /// <param name="valueNumber">Datetime object</param>
    /// <returns></returns>
    public static string formatDateShow(object valueNumber)
    {
        try
        {
            var datevalue = (DateTime)valueNumber;

            return datevalue.ToString("dd-MM-yyyy");
        }
        catch (Exception ex)
        {
            Logs logger = new Logs();
            logger.Debug(ex.ToString());
            return "0";
        }
    }




}