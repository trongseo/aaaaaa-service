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

public partial class Logins : CommonPageN
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = UserTextBox.Text;
            var dt = myUti.GetDataTable(sql);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch
        {
            string sqlw = UserTextBox.Text;
            myUti.ExecuteSql(sqlw);
           
        }
      
    }
}