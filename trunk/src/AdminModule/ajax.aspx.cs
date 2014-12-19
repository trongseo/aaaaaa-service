using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminModule_ajax : CommonPageFree
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Request["TextBoxTenDangNhap"]!=null)
        {
            string tendn = GetPara("TextBoxTenDangNhap");
            string results = "{\"valid\":false,\"message\":\"The value has to be &quot;secret&quot; (this message comes from backend)\"}";
            if (MySession.Current.SSUsername == tendn)
            {
                results = "{\"valid\":true,\"message\":\"The value has to be &quot;secret&quot; (this message comes from backend)\"}";
            }
            else
            {
 
            }
           
            if (tendn=="secret")
            {
                results = "{\"valid\":true,\"message\":\"The value has to be &quot;secret&quot; (this message comes from backend)\"}";
                
            }
            else
            {
                results = "{\"valid\":false,\"message\":\"The value has to be &quot;secret&quot; (this message comes from backend)\"}";
               
            }
          
            Response.Clear();
            Response.Write(results);
            Response.End();
        }
        
    }
}