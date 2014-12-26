using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class AdminModule_Login1 : CommonPageN
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
       

    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        if (  MySession.Current.SSMatKhauadmin==UserTextBox.Text)
        {
            MySession.Current.SSMatKhauadmin = "";
            Response.Redirect("Nhanvienlist.aspx");
        }
    }
}