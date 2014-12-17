using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LienHe : CommonPageFree
{
    public DataTable dtCodeList = new DataTable();

    protected void Page_Init(object sender, EventArgs e)
    {
        MySession.Current.ScreenId = "LienHe";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;

       
    }

  

  
}