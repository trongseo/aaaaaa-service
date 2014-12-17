using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDetail : CommonPageFree
{
    public string latint = "";
    public string longint = "";
    /// <summary>
    /// Data show
    /// </summary>
    public DataTable dtCodeList = new DataTable();

    protected void Page_Init(object sender, EventArgs e)
    {
        MySession.Current.ScreenId = "ViewDetail";
    }
    public DataRow item;
    public DataTable dtImages;
    public string loairap = "";
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Ulti.GetParaUrl("CateId") != "")
        {
          
            string sql = @"SELECT   top 1   *
                        FROM         SPWeb WHERE CateId=@CateId  ";
            MY_HASTABLE["CateId"] = Ulti.GetParaUrl("CateId");
            MY_DATATABLE = myUti.GetDataTable(sql, MY_HASTABLE);
            item = MY_DATATABLE.Rows[0];
          
            MY_HASTABLE.Clear();
            sql = @"SELECT   ID,   USER_INFO_ID,IMAGE1,replace(IMAGE1, '.jpg', '_crop2_2.jpg') as HINH_DAIDIEN_NHO,MOTA
                        FROM         USER_INFO_IMAGES WHERE USER_INFO_ID=@ID  ";
            MY_HASTABLE["ID"] =item["ID"].ToString();
            dtImages = myUti.GetDataTable(sql, MY_HASTABLE);
           
            
        }

    }
}