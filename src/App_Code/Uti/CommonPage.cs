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

/// <summary>
/// Summary description for MyPage
/// </summary>
public class CommonPage : System.Web.UI.Page
{
    public Logs logger = null;
    public MyLange myLange = new MyLange();
    public MyUtilities myUti = new MyUtilities();
    public string MY_MODULE_ID = "";
    public string MY_MENU_ID = "";
    public bool isPartPage = false;
    public Hashtable MY_HASTABLE = new Hashtable();
    public DataTable MY_DATATABLE = new DataTable();
    public CommonPage()
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
    
    public void SetPermissionButton()
    {
        if (MySession.Current.UserId=="Admin")
        {
            return;
        }

        
        DataRow[] arrGet = MySession.Current.DT_AcessRights.Select("ModuleID='" + MY_MODULE_ID + "' and MenuID='" + MY_MENU_ID + "'");
        if (arrGet.Length == 0)
        {
            return;
        }
      
        string PermissionNumber = arrGet[0]["PermissionNumber"].ToString();
       /// Response.Write(MY_MODULE_ID + MY_MENU_ID + MySession.Current.UserId + "-per:" + PermissionNumber);
        //myPermi 1xem 2them 3sua 4xoa
        foreach (Control control in this.Form.Controls)
        {
             string controlId = control.ID;
                if (control is Button)
                {
                    if (controlId =="ButtonCreate")
	                {
                        if (IsShow(PermissionNumber, 2) != "")
                        {
                            ((Button)control).Enabled = true;
                          
                        }
                        else
                        {
                            ((Button)control).Enabled = false;
                        }
		 
	                }else
                    if (controlId =="ButtonUpdate")
	                {
                        if (IsShow(PermissionNumber, 3) != "")
                        {
                            ((Button)control).Enabled = true;
                           
                        }
                        else
                        {
                            ((Button)control).Enabled = false;
                        }
	                }else
                    if (controlId =="ButtonDelete")
	                {
                        if (IsShow(PermissionNumber, 4) != "")
                        {
                            ((Button)control).Enabled = true;
                        }
                        else
                        {
                            ((Button)control).Enabled = false;
                        }
	                }
                    
                }
        }
	
        
    }
    /// <summary>
    /// //myPermi 1xem 2them 3sua 4xoa
    /// </summary>
    /// <param name="permissNumber"></param>
    /// <param name="myPermi">khac empty thi ok</param>
    /// <returns></returns>
    public string IsShow(string permissNumber, int myPermi)
    {
        if (permissNumber == null) return "";
        if (permissNumber == "") return "";
        //myPermi 1xem 2them 3sua 4xoa
        switch (int.Parse(permissNumber))
        {
            case 0:
                {
                    if (myPermi == 1)
                    {
                        return "checked=checked";
                    }

                    break;
                }
            case 1:
                {
                    if (myPermi == 1)
                    {
                        return "checked=checked";
                    }

                    if (myPermi == 2)
                    {
                        return "checked=checked";
                    }
                    break;
                }
            case 2:
                {
                    if (myPermi == 1)
                    {
                        return "checked=checked";
                    }

                    if (myPermi == 3)
                    {
                        return "checked=checked";
                    }
                    break;
                }
            case 3:
                {
                    if (myPermi == 1)
                    {
                        return "checked=checked";
                    }

                    if (myPermi == 2)
                    {
                        return "checked=checked";
                    }
                    if (myPermi == 3)
                    {
                        return "checked=checked";
                    }
                    break;
                }
            case 4:
                {
                    if (myPermi == 1)
                    {
                        return "checked=checked";
                    }

                    if (myPermi == 4)
                    {
                        return "checked=checked";
                    }
                    break;
                }
            case 5:
                {
                    if (myPermi == 1)
                    {
                        return "checked=checked";
                    }

                    if (myPermi == 2)
                    {
                        return "checked=checked";
                    }
                    if (myPermi == 4)
                    {
                        return "checked=checked";
                    }
                    break;
                }
            case 6:
                {
                    if (myPermi == 1)
                    {
                        return "checked=checked";
                    }

                    if (myPermi == 3)
                    {
                        return "checked=checked";
                    }
                    if (myPermi == 4)
                    {
                        return "checked=checked";
                    }
                    break;
                }
            case 7:
                {
                    if (myPermi == 1)
                    {
                        return "checked=checked";
                    }

                    if (myPermi == 2)
                    {
                        return "checked=checked";
                    }
                    if (myPermi == 3)
                    {
                        return "checked=checked";
                    }
                    if (myPermi == 4)
                    {
                        return "checked=checked";
                    }
                    break;
                }
        }

        return "";
    }

    public bool CheckValidAccess(string ModuleId, string childMenu)
    {
        if (MySession.Current.UserId == "Admin")
        {
            return true;
        }
        //Neu la những pages thành phần ví dụ update user,update group... thi kiem tra quyen tren chinh man hinh do
        if (isPartPage)
        {
            return true;
        }
        DataRow[] arrGet = MySession.Current.DT_AcessRights.Select("ModuleID='" + ModuleId + "' and MenuID='" + childMenu + "'");
        if (arrGet.Length == 0)
        {
            return false;
        }
        return true;
    }

    private void CommonPage_Load(object sender, EventArgs e)
    {

        if (MySession.Current.UserId == null)
        {
            Response.Redirect("Login.aspx");
        }
        //Kiểm tra quyền trong trường hợp truy cập trực tiếp bằng gõ url,ko thông qua click
        //if (MY_MENU_ID != "DefaultWebcome")
        //if (!CheckValidAccess( MY_MODULE_ID,  MY_MENU_ID))
        //{
        //    Response.Redirect("../Account/Login.aspx");
        //}
        string pageName = MY_MENU_ID;
        try
        {
            string absPath = Request.Url.AbsolutePath;
            string[] allPath = absPath.Split("/".ToCharArray());
            pageName = allPath[allPath.Length - 1];

        }
        catch
        {
        }
        
    }

}