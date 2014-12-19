using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Resources;
using System.Threading;
using System.Reflection;
using System.Data;
using System.Collections;
using System.Data;
/// <summary>
/// Summary description for MyPage
/// </summary>
public class CommonPageFree : System.Web.UI.Page
{
    public Logs logger = null;
    public MyLange myLange = new MyLange();
    public MyUtilities myUti = new MyUtilities();
    public string MY_MODULE_ID = "";
    public string MY_MENU_ID = "";
    public string SERVICE_TYPE_PHIM = "1";
    public string SERVICE_TYPE_KARA = "2";
    public string SERVICE_TYPE_BIDA = "3";
    public bool isPartPage = false;
    public string imagePathRoot = "http://admin.congtydetvothenguyen.com/ItemImage/";
    public Hashtable MY_HASTABLE = new Hashtable();
    public DataTable MY_DATATABLE = new DataTable();
    public CommonPageFree()
    {
        //
        // TODO: Add constructor logic here
        //
       
        base.Load += new EventHandler(CommonPage_Load);
        try
        { 
            logger = new Logs();
        }
        catch
        { 
        }
       
    }


    public string GetPara(string paraName)
    {
        if (Request[paraName]!=null)
        {
            return Request[paraName].Trim();
        }
        return "";
    }
    private void CommonPage_Load(object sender, EventArgs e)
    {
        if (Request.Url.ToString().IndexOf("localhost") > -1)
        {
            imagePathRoot = "http://localhost:22222/anhthesockscode/ItemImage/";
        }
       
            if (MySession.Current.SSUsername != "admin")
            {
                Response.Redirect("Login.aspx");
            }
       
       
        string pageName = MySession.Current.ScreenId;
        try
        {
            string absPath = Request.Url.AbsolutePath;
            string[] allPath = absPath.Split("/".ToCharArray());
            pageName = allPath[allPath.Length - 1];

        }
        catch
        {
        }
        
        MySession SSCurrent = MySession.Current;
        string strCultureInfo = "Viet";

        if (SSCurrent.ssCultureInfo != null)
        {
            strCultureInfo = SSCurrent.ssCultureInfo;
        }

        if (Request["langue"] != null)
        {
            if (Request["langue"] == "vi")
            {
                strCultureInfo = "Viet";
            }
            else
                if (Request["langue"] == "en")
                {
                    strCultureInfo = "Eng";
                }
        }

        SSCurrent.ssCultureInfo = strCultureInfo;
      
        //myLange.prepareLangue(SSCurrent.ScreenId, strCultureInfo);
        //string tempText = "";
        //foreach (Control control in this.Form.Controls)
        //{
        //    //string IdControl = control.ID;

        //    //if (IdControl == "UCHeader1")
        //    //foreach (Control menuControl in control.Controls)
        //    //{
        //    //    string menuIdControl = menuControl.ID;
        //    //    if (menuControl is Button)
        //    //    {
        //    //        //tempText = myLange.getText(menuIdControl);
        //    //        //if (tempText != "")
        //    //        //{
        //    //        //    ((Button)menuControl).Text = tempText;
        //    //        //}
        //    //        //else
        //    //        //{

        //    //        //    myUti.InsertDataReturnID("Insert into  LANGUAGES(ScreenId,ControlId,Viet,Eng) values('MENU','" + menuIdControl + "',N'" + ((Button)menuControl).Text + "',N'" + ((Button)menuControl).Text + "')", null);
        //    //        //}
                   
        //    //    }
        //    //    //else
        //    //    //    if (menuControl is Literal)
        //    //    //    {
        //    //    //        //tempText = myLange.getText(menuIdControl);
        //    //    //        //if (tempText != "")
        //    //    //        //{
        //    //    //        //    ((Literal)menuControl).Text = tempText;
        //    //    //        //}
        //    //    //        //else
        //    //    //        //{
        //    //    //        //    try
        //    //    //        //    {

        //    //    //        //        myUti.InsertDataReturnID("Insert into  LANGUAGES(ScreenId,ControlId,Viet,Eng) values('MENU','" + menuIdControl + "',N'" + ((Literal)menuControl).Text + "',N'" + ((Literal)menuControl).Text + "')", null);
        //    //    //        //    }
        //    //    //        //    catch (Exception es)
        //    //    //        //    {
        //    //    //        //        logger.Info(es.ToString());
        //    //    //        //    }
                           
        //    //    //        //}
                       
        //    //    //    }

        //    //}

        //    //if (control is Button)
        //    //{
        //    //    //if (((Button)control).CssClass.IndexOf("0000") == -1)
        //    //    //{
        //    //    //    ((Button)control).Text = myLange.getText(IdControl);
        //    //    //}
        //    //    //((Button)control).Text = myLange.getText(IdControl);
        //    //    //tempText = myLange.getText(IdControl);
        //    //    //if (tempText != "")
        //    //    //{
        //    //    //    ((Button)control).Text = tempText;
        //    //    //}
        //    //    //else
        //    //    //{
        //    //    //    try
        //    //    //    {


        //    //    //        myUti.InsertDataReturnID("Insert into  LANGUAGES(ScreenId,ControlId,Viet,Eng) values('" + MySession.Current.ScreenId + "','" + IdControl + "',N'" + ((Button)control).Text + "',N'" + ((Button)control).Text + "')", null);
        //    //    //    }
        //    //    //    catch (Exception es)
        //    //    //    {
        //    //    //        logger.Info(es.ToString());
        //    //    //    }
        //    //    //}

        //    //}
        //    //else
        //    //    if (control is Literal)
        //    //    {
                  

        //    //        //tempText = myLange.getText(IdControl);
        //    //        //if (tempText != "")
        //    //        //{
        //    //        //    ((Literal)control).Text = tempText;
        //    //        //}
        //    //        //else
        //    //        //{
        //    //        //    try
        //    //        //    {


        //    //        //        myUti.InsertDataReturnID("Insert into  LANGUAGES(ScreenId,ControlId,Viet,Eng) values('" + MySession.Current.ScreenId + "','" + IdControl + "',N'" + ((Literal)control).Text + "',N'" + ((Literal)control).Text + "')", null);
        //    //        //    }
        //    //        //    catch (Exception es)
        //    //        //    {
        //    //        //        logger.Info(es.ToString());
        //    //        //    }
        //    //        //}

        //    //    }
        //        //else
        //        //    if (control is CheckBox)
        //        //    {


        //        //        tempText = myLange.getText(IdControl);
        //        //        if (tempText != "")
        //        //        {
        //        //            ((CheckBox)control).Text = tempText;
        //        //        }
        //        //        else
        //        //        {
        //        //            try
        //        //            {


        //        //                myUti.InsertDataReturnID("Insert into  LANGUAGES(ScreenId,ControlId,Viet,Eng) values('" + MySession.Current.ScreenId + "','" + IdControl + "',N'" + ((CheckBox)control).Text + "',N'" + ((CheckBox)control).Text + "')", null);
        //        //            }
        //        //            catch (Exception es)
        //        //            {
        //        //                logger.Info(es.ToString());
        //        //            }
        //        //        }

        //        //    }
        //}
    }

}