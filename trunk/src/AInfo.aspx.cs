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

public partial class AInfo : CommonPageNhanVien
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        if (GetPara("from")=="hoanthanh")
        {
            ButtonHoanThanh();
            return;
        }
        TextBoxTenDangNhap.Text = MySession.Current.SSUserFullName;
        TextBoxTienTrongTK.Text = myUti.GetOneField("Select  REPLACE(CONVERT(varchar(20), (CAST(([SoTien]) AS money)), 1), '.00', '')  from ATaiKhoan where athanhvienid=" + MySession.Current.SSUserId);
        //dau tien vao man hinh nay se co 1 gio hang cho user do
        if (MySession.Current.SSGuidGioHang==null)
	    {
            //kiem tra xem con don hang chua hang thanh chua
            //
            string sqlchec="Select guid_giohang from agiohangtemp where adonhang_guid_id is null and anhanvienid="+MySession.Current.SSUserId;
            string guid = myUti.CheckExist(sqlchec);
            if (guid != null)
            {
                MySession.Current.SSGuidGioHang = guid;
            }
            else
            {
                MySession.Current.SSGuidGioHang = myUti.GetGuid_Id();
            }
           
	    }
        TextBoxNgaySP.Text = DateTime.Now.ToString("dd-MM-yyyy");
        TextBoxNgayDV.Text = DateTime.Now.ToString("dd-MM-yyyy HH:mm");
        DataTable dtc = myUti.GetDataTable("Select title AS title,id AS id from catetype where acuahangid=" + MySession.Current.SSCuaHangId);

        DropDownListLoaiSP.DataSource = dtc;
        DropDownListLoaiSP.DataTextField = "title";
        DropDownListLoaiSP.DataValueField = "id";
        DropDownListLoaiSP.DataBind();

        DropDownListLoaiSP.Items.Insert(0, new ListItem("...Chọn..", "0"));
        DropDownListLoaiSP.SelectedIndex = 0;


        DataTable dtcport = myUti.GetDataTable("Select PortNumber AS title,id AS id from aport where acuahangid=" + MySession.Current.SSCuaHangId);

        DropDownListAport.DataSource = dtcport;
        DropDownListAport.DataTextField = "title";
        DropDownListAport.DataValueField = "id";
        DropDownListAport.DataBind();

        DropDownListAport.Items.Insert(0, new ListItem("...Chọn..", ""));
        DropDownListAport.SelectedIndex = 0;


        //loai dich vu
        DataTable dtcdv = myUti.GetDataTable("Select title AS title,id AS id from ADanhMucDv where acuahangid=" + MySession.Current.SSCuaHangId);

        DropDownListLoaiDV.DataSource = dtcdv;
        DropDownListLoaiDV.DataTextField = "title";
        DropDownListLoaiDV.DataValueField = "id";
        DropDownListLoaiDV.DataBind();

        DropDownListLoaiDV.Items.Insert(0, new ListItem("...Chọn..", "0"));
        DropDownListLoaiDV.SelectedIndex = 0;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      
       

    }


    protected void ButtonHoanThanh()
    {
        string guidgiohang = MySession.Current.SSGuidGioHang;

        string sql1 = " update agiohangtemp set adonhang_guid_id='" + guidgiohang + "'  where guid_giohang='" + guidgiohang + "'";
        string madonhang = DateTime.Now.ToString("yyMMddHHmmss") + MySession.Current.SSUserId;
           
            string sqlxd = "  INSERT INTO [dbo].[ADonHang]( [guid_id] ,[Athanhvienid],[ACuaHangId],[MaDonHang])   VALUES('" + guidgiohang + "'," + MySession.Current.SSUserId + "," + MySession.Current.SSCuaHangId + ",'" + madonhang + "')";

            ArrayList arsql = new ArrayList();
            arsql.Add(sql1);
            arsql.Add(sqlxd);
            ArrayList arHS = new ArrayList();
            arHS.Add(new Hashtable());
            arHS.Add(new Hashtable());
            myUti.InsertTrans(arsql, arHS, "commitdonhang");
            MySession.Current.SSGuidGioHang = null;
        //tru tien khach hang
            Response.Redirect("Ainfo.aspx");

    }
}