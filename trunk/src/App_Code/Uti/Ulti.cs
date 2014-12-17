using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Security.Cryptography;
using System.Text;
/// <summary>
/// Summary description for Ulti
/// </summary>
public class Ulti
{
	public Ulti()
	{
		//
		// TODO: Add constructor logic here
		//
        
	}
    public static string MD5Hash(string text)
    {
        MD5 md5 = new MD5CryptoServiceProvider();

        //compute hash from the bytes of text
        md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

        //get hash result after compute it
        byte[] result = md5.Hash;

        StringBuilder strBuilder = new StringBuilder();
        for (int i = 0; i < result.Length; i++)
        {
            //change it into 2 hexadecimal digits
            //for each byte
            strBuilder.Append(result[i].ToString("x2"));
        }

        return strBuilder.ToString();
    }
    public static DropDownList SetComboboxCargo(DropDownList obj)
    {
       
                        obj.Items.Add("");
                        obj.Items.Add("General");
                        obj.Items.Add("Empty");
                        obj.Items.Add("Reefer");
                        obj.Items.Add("Dangerous");
                        obj.Items.Add("Dangerous empty");
                        obj.Items.Add("Reefer & DG");
                        obj.Items.Add("Bundle");
                        obj.Items.Add("Break-bulk");
                        obj.Items.Add("Awkward");
                        obj.Items.Add("Hide");
                        obj.Items.Add("Over Height");
                        obj.Items.Add("Over Length");
                        obj.Items.Add("Over Weigh");
                        obj.Items.Add("Reefer & Over Weigh");
                        obj.Items.Add("Over Weigh >36T");
                        obj.Items.Add("Reefer & Over Weigh >36T");
                        obj.Items.Add("Oversize & Over Weigh");
                        obj.Items.Add("Oversize & Over Weigh >36T");
                        return obj;
    }
    public static DropDownList SetComboboxCategory(DropDownList obj)
    {

        obj.Items.Add("");
        obj.Items.Add("Import");
        obj.Items.Add("Empty");
        obj.Items.Add("Export");
        obj.Items.Add("Import Storage");
        obj.Items.Add("Export Storage");
        return obj;
    }
    /// <summary>
    /// dd/mm/yyyy -->yyyy-mm-dd
    /// </summary>
    /// <param name="dateValue"></param>
    /// <returns></returns>
    public static string ConvertDateVietToSystem(string dateValue)
    {
        string[] arrDate = dateValue.Split("/".ToCharArray());
        return arrDate[2] + '-' + arrDate[1] +'-'+ arrDate[0];
    }
    public static DropDownList SetCombobox(DropDownList obj,System.Data.DataTable dtData)
    {
        obj.DataSource = dtData;
        obj.DataValueField = dtData.Columns[0].ColumnName;
        obj.DataTextField = dtData.Columns[1].ColumnName;
        obj.DataBind();
        return obj;
    }
    public static DropDownList SetComboboxSelectedValue(DropDownList obj, System.Data.DataTable dtData,string valueSelected)
    {


        obj.DataSource = dtData;

        obj.DataValueField = dtData.Columns[0].ColumnName;
        obj.DataTextField = dtData.Columns[1].ColumnName;
        obj.DataBind();
        obj.SelectedValue = valueSelected;
        return obj;
    }
    /// <summary>
    /// column 0:value;column 1:text
    /// </summary>
    /// <param name="obj"></param>
    /// <param name="dtData"></param>
    /// <param name="firstRow"></param>
    /// <returns></returns>
    public static DropDownList SetCombobox(DropDownList obj, System.Data.DataTable dtData,string firstRow)
    {
        DataRow myDataRow = dtData.NewRow();
        myDataRow[0] = firstRow;
        dtData.Rows.InsertAt(myDataRow, 0);

        
        obj.DataSource = dtData;

       obj.DataValueField = dtData.Columns[0].ColumnName;
        obj.DataTextField = dtData.Columns[1].ColumnName;
        obj.DataBind();
        return obj;
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
            page.ClientScript.RegisterClientScriptBlock(typeof(Ulti), "alert", script);
        }
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
            page.ClientScript.RegisterClientScriptBlock(typeof(Ulti), "alert", script);
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
            page.ClientScript.RegisterClientScriptBlock(typeof(Ulti), "confirm", script);
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
            page.ClientScript.RegisterClientScriptBlock(typeof(Ulti), "alert", script);
        }
    }
        public static DropDownList SetComboboxControlStatus(DropDownList obj)
    {
       
                  obj.Items.Add("");
                       
                        obj.Items.Add("Reserved");
                        obj.Items.Add("Baplie Reserved");
                        obj.Items.Add("Stacking");
                        obj.Items.Add("Outgoing");
                        obj.Items.Add("Incoming");
                        obj.Items.Add("Delivery");
                        obj.Items.Add("Remashalling");
                        return obj;
    }

        public static string GetParaUrl(string  paraGet)
        {
     
            if (HttpContext.Current.Request[paraGet]!=null)
            {
                return HttpContext.Current.Request[paraGet].ToString();
            }
            return "";
        }
    public static string GetCargo(string values)
    {
        switch (values)
        {
            case "GP":
                return "General";
            case "MT":
                return "Empty";
            case "RF":
                return "Reefer";
            case "DG":
                return "Dangerous";
            case "ED":
                return "Dangerous empty";
            case "DR":
                return "Reefer & DG";
            case "BN":
                return "Bundle";
            case "BB":
                return "Break-bulk";
            case "AK":
                return "Awkward";
            case "HD":
                return "Hide";
            case "OH":
                return "Over Height";
            case "OL":
                return "Over Length";
            case "OW":
                return "Over Weigh";
            case "RO":
                return "Reefer & Over Weigh";
            case "W2":
                return "Over Weigh >36T";
            case "R2":
                return "Reefer & Over Weigh >36T";
            case "S1":
                return "Oversize & Over Weigh";
            case "S2":
                return "Oversize & Over Weigh >36T";
            case "*":
                return "";
            default:
                return "";
        }
    }
}
