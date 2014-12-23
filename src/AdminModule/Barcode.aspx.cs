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

public partial class AdminModule_Barcode : CommonPageFree
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        DataTable dtc = myUti.GetDataTable("Select  CONVERT(varchar(100), id)  + '-' +HoTen+' ' + SDT AS title,id AS id from ANhanVien where acuahangid=" + MySession.Current.SSCuaHangId + " order by HoTen ");
        DropDownList1.DataSource = dtc;
        DropDownList1.DataTextField = "title";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, new ListItem("..Chọn..", ""));
        DropDownList1.SelectedIndex = 0;
        if (Request["Id"] != null)
        {

            string myid = Request["Id"];
            //        ,[Title]
            //,[DateCreate]
            //,[Shortdescription]
            //,[Description]
            //,[ImageNews]
            //,[IsActive]
            //,[IsDelete]
            //,[ViewPriority]
            //,[IsHome]
            //,[CateId]
            string sql = " SELECT * " +
              "  FROM [ATheThanhVien]  where id=" + myid;
            DataRow dr = myUti.GetDataRow(sql);

            TextBoxBarcode.Text = dr["MaThe"].ToString();
            TextBoxGhiChu.Text = dr["Ghichu"].ToString();
            DropDownList1.SelectedValue = dr["ANhanVienId"].ToString();
            CheckBoxIslock.Checked = dr["Islock"].ToString()=="1"?true:false;
        }
        //myUti.
    }
    void updateBarcode()
    {
        //Giaodich nap tien, con  don tien vao tai khoan ataikhoan
        if (!Page.IsValid)
        {
            return;
        }
        string guid = myUti.GetGuid_Id();
        string sql = " insert into ATheThanhVien(Ghichu) values('') ";
        string myid = "";
        if (Request["Id"] == null)
        {
            myid = myUti.InsertData(sql, null);
        }
        else
        {
            myid = Request["Id"];
        }
       string islock =  CheckBoxIslock.Checked == true?"1":"0";
        System.Collections.Hashtable hs = new Hashtable();
        hs["Ghichu"] = TextBoxGhiChu.Text == "" ? "admin" : TextBoxGhiChu.Text;
        sql = "UPDATE [ATheThanhVien] " +
        " SET [Ghichu] =@Ghichu" +
         " ,[MaThe] = " + TextBoxBarcode.Text.Trim() +
         " ,[Islock] = " + islock +
          " ,[ANhanVienId] = " + DropDownList1.SelectedValue.Trim() +
            " ,[ACuaHangId] = " + MySession.Current.SSCuaHangId +
        " WHERE id=" + myid;
        myUti.UpdateData(sql, hs);
        ArrayList ArrayListSQL = new ArrayList();
        ArrayListSQL.Add(sql);
         ArrayList ArrayListSQLHashTable = new ArrayList();
        ArrayListSQLHashTable.Add(hs);

        string sql2 = "UPDATE [Anhanvien] " +
        " SET [ATheThanhVienId] =" + myid+
        " WHERE Id=" + DropDownList1.SelectedValue.Trim();
        var hs2 = new Hashtable();

        ArrayListSQL.Add(sql2);
        ArrayListSQLHashTable.Add(hs2);
        myUti.InsertTrans(ArrayListSQL, ArrayListSQLHashTable, "barcode");
    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        updateBarcode();
        Response.Redirect("NhanVienList.aspx");
    }

   
   
    protected void SaveButton0_Click(object sender, EventArgs e)
    {
        updateBarcode();
        Response.Redirect("Barcode.aspx");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string userid = DropDownList1.SelectedValue;
        var dtt = myUti.GetDataTable("select id from ATheThanhVien where anhanvienid=" + userid + " and acuahangid=" + MySession.Current.SSCuaHangId);
        if (dtt.Rows.Count == 1)
        {
            string idd = dtt.Rows[0]["id"].ToString();
            Response.Redirect("barcode.aspx?id=" + idd);
        }
        else
        {
            CheckBoxIslock.Checked = false;
            TextBoxBarcode.Text = "";

        }
        
        
    }
}