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
using ImageResizer;

public partial class AdminModule_NapTien : CommonPageFree
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        DataTable dtc = myUti.GetDataTable("Select  CONVERT(varchar(100), id)  + '-' +HoTen+' ' + SDT AS title,id AS id from ANhanVien where acuahangid=" + MySession.Current.SSCuaHangId + " order by HoTen ");
        DropDownList1.DataSource = dtc;
        DropDownList1.DataTextField = "title";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        if (Request["anhanvienid"] != null)
        {
          
            DropDownList1.SelectedValue = Request["anhanvienid"];
            return;
        }
        //if (Request["Id"] != null)
        //{

        //    string myid = Request["Id"];
        //    //        ,[Title]
        //    //,[DateCreate]
        //    //,[Shortdescription]
        //    //,[Description]
        //    //,[ImageNews]
        //    //,[IsActive]
        //    //,[IsDelete]
        //    //,[ViewPriority]
        //    //,[IsHome]
        //    //,[CateId]
        //    string sql = " SELECT * " +
        //      "  FROM [aGiaodichnaptien]  where id=" + myid;
        //    DataRow dr = myUti.GetDataRow(sql);

        //    TextBox3Price.Text = dr["Sotien"].ToString();
        //    TextBoxGhiChu.Text = dr["Ghichu"].ToString();
        //    DropDownList1.SelectedValue = dr["Athanhvienid"].ToString();
        //}
        //myUti.
    }
    void updateNaptien()
    {
        //Giaodich nap tien, con  don tien vao tai khoan ataikhoan
        if (!Page.IsValid)
        {
            return;
        }
        string guid = myUti.GetGuid_Id();
        string sql = " insert into aGiaodichnaptien(guid_id) values('" + guid + "') ";
        string myid = "";
        if (Request["Id"] == null)
        {
            myid = myUti.InsertData(sql, null);
        }
        else
        {
            myid = Request["Id"];
        }

        System.Collections.Hashtable hs = new Hashtable();
        hs["Ghichu"] = TextBoxGhiChu.Text == "" ? "admin" : TextBoxGhiChu.Text;
        sql = "UPDATE [AGiaoDichNapTien] " +
        " SET [Ghichu] =@Ghichu" +
         " ,[Sotien] = " + TextBox3Price.Text.Trim() +
           " ,[loaigiaodich] = " + Constants.GiaoDich_naptien +
          " ,[Athanhvienid] = " + DropDownList1.SelectedValue.Trim() +
            " ,[ACuaHangId] = " + MySession.Current.SSCuaHangId +
        " WHERE id=" + myid;
        myUti.UpdateData(sql, hs);
        ArrayList ArrayListSQL = new ArrayList();
        ArrayListSQL.Add(sql);
         ArrayList ArrayListSQLHashTable = new ArrayList();
        ArrayListSQLHashTable.Add(hs);

        string sql2 = "UPDATE [ATaiKhoan] " +
        " SET [Sotien] =Sotien+ " + TextBox3Price.Text.Trim() +
        //  " ,[Athanhvienid] = " + DropDownList1.SelectedValue.Trim() +
        " WHERE Athanhvienid=" +  DropDownList1.SelectedValue.Trim() ;
        var hs2 = new Hashtable();

        ArrayListSQL.Add(sql2);
        ArrayListSQLHashTable.Add(hs2);
        myUti.InsertTrans(ArrayListSQL, ArrayListSQLHashTable, "naptien");
    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        updateNaptien();
        Response.Redirect("NhanVienList.aspx");
    }

   
   
    protected void SaveButton0_Click(object sender, EventArgs e)
    {
        updateNaptien();
        Response.Redirect("Naptien.aspx");
    }
}