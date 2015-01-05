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

public partial class AdminModule_DichVu : CommonPageFree
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        DataTable dtc = myUti.GetDataTable("Select  title AS title,id AS id from ADanhMucDV where acuahangid=" + MySession.Current.SSCuaHangId + " ");
        DropDownList1.DataSource = dtc;
        DropDownList1.DataTextField = "title";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
       
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
              "  FROM [ADichVu]  where id=" + myid;
            DataRow dr = myUti.GetDataRow(sql);

            TextBoxSoPhut.Text = dr["SoPhut"].ToString();
            TextBoxGiatien.Text = dr["PriceSale"].ToString();
            DropDownList1.SelectedValue = dr["ADanhMucDVId"].ToString();


          

        }
        //myUti.
    }
    void updateDichVu()
    {
        //Giaodich nap tien, con  don tien vao tai khoan ataikhoan
        if (!Page.IsValid)
        {
            return;
        }
        string guid = myUti.GetGuid_Id();
        string sql = " insert into ADichVu(TenDV) values('') ";
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
        hs["TenDV"] = TextBoxMota.Text.Trim();
        sql = "UPDATE [ADichVu] " +
        " SET [SoPhut] =" + TextBoxSoPhut.Text.Trim() +
         " ,[PriceSale] = " + TextBoxGiatien.Text.Trim() +
            " ,[TenDV] =@TenDV " +
          " ,[ADanhMucDVId] = " + DropDownList1.SelectedValue.Trim() +
            " ,[ACuaHangId] = " + MySession.Current.SSCuaHangId +
        " WHERE id=" + myid;
        myUti.UpdateData(sql, hs);
        
    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        updateDichVu();
        Response.Redirect("DichVuList.aspx");
    }

   
   
    protected void SaveButton0_Click(object sender, EventArgs e)
    {
        updateDichVu();
        Response.Redirect("DichVu.aspx");
    }
}