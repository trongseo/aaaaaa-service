using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for MyLange
/// </summary>
public class MyLange
{
    private DataTable dtLange = new DataTable();
    public string _screenId = "";
    public string _langColumn = "";
    public MyLange()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void prepareLangue(string screenId, string langColumn)
    {
        _langColumn = langColumn;
        MyUtilities myUti = new MyUtilities();
        //dtLange = myUti.SelectData(" select Id,ScreenId,ControlId,Viet,Eng From  LANGUAGES where ScreenId='"+screenId+"'", null);
        dtLange = myUti.SelectData(" select ControlId, " + langColumn + " as langColumn From  LANGUAGES where ScreenId='MENU' OR ScreenId='" + screenId + "'", null);
        _screenId = screenId;
    }
    public string getText(string ControlId)
    {
        try
        {
            DataRow[] drGet = dtLange.Select("ControlId='" + ControlId + "'");

            if (drGet.Length == 0)
            {
                MyUtilities myUti = new MyUtilities();

                string onfile = myUti.ExecuteSQLOneValue(" select  " + _langColumn + " as langColumn From  LANGUAGES where  ControlId='" + ControlId + "'", null);
                
                return onfile;
            }

            return drGet[0][1].ToString();
        }
        catch
        {

            return "";
        }


    }


}