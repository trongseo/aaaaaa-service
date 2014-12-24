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

public partial class RegistBarcode : CommonPageN
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        DataTable dtc = myUti.GetDataTable("Select TenCuaHang AS title,id AS id from ACuaHang ");
        DropDownList1.DataSource = dtc;
        DropDownList1.DataTextField = "title";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        
        if (GetPara("from") == "logout")
        {
            Session.Clear();
        }
        Label1.Visible = false;

    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        
    }
    protected void ButtonLoginBarcode_Click(object sender, EventArgs e)
    {
        string manhanvien = TextBoxBarcode.Text.Trim();
        string madangky = TextBoxDangKy.Text.Trim();
        MY_HASTABLE["mathe"] = manhanvien;
        ///////////////Kiem tra xem nhan vien dang nhap duoc khong
        string sqlg = @"SELECT        ANhanVien.ACuaHangId, ANhanVien.TenDangNhap, ANhanVien.SDT, ANhanVien.HoTen, ANhanVien.Id, ATheThanhVien.MaThe
FROM            ATheThanhVien INNER JOIN
                         ANhanVien ON ATheThanhVien.ANhanVienId = ANhanVien.Id
WHERE        (ATheThanhVien.Islock = 0) AND ANhanVien.aphancapid <>4 and (ATheThanhVien.MaThe ='" + manhanvien + "')";
        var dtcheck = myUti.GetDataTable(sqlg, MY_HASTABLE);
        if (dtcheck.Rows.Count == 0)
        {
            SystemUti.Show("Thẻ nhân viên bị sai hoặc đã bị khóa!");
            return;
        }
        ////////////////// ////////////////// ////////////////// ////////////////// //////////////////
        /////Kiem tra xem the moi co ton tai chua
        var hsch = new Hashtable();
        hsch["mathe"]=madangky;
        var drexist = myUti.GetDataRowNull("select mathe from athethanhvien where mathe=@mathe", hsch);
        if (drexist !=null)
        {
            SystemUti.Show("Thẻ mới này đã có người đăng ký!");
            return;
        }
        ////////////////// ////////////////// ////////////////// ////////////////// ////////////////

        MySession.Current.SSCuaHangId = DropDownList1.SelectedValue;
        //thethanhvien,nhanvien,taikhoantien
        string guidid = myUti.GetGuid_Id();
        ArrayList ArrayListSQL = new ArrayList();
        ArrayList ArrayListSQLHashTable = new ArrayList();

        ////////////////// //////////////////them 1 khach hang moi
        string sqlANhanVien = " insert into ANhanVien(aphancapid,aloaithanhvienid,acuahangid,guid_id) values(4,7," + DropDownList1.SelectedValue + ",'" + guidid + "') ";
           string ndnewid = myUti.InsertData(sqlANhanVien, null);
           ////////////////// //////////////////

           ////////////////// ////////////////// themoi taikhoan,athethanhvien,cap nhat the thanh vien vao nhan vien
        string sqltaikhoan1 = "insert into AtaiKhoan(guid_id,athanhvienid) values('" + guidid + "'," + ndnewid + ");";
        ArrayListSQL.Add(sqltaikhoan1);
        ArrayListSQLHashTable.Add(new Hashtable());

        string ANhanVienId_NhanVienCap = dtcheck.Rows[0]["Id"].ToString();
        string guid = myUti.GetGuid_Id();

        string sql2 = " insert into ATheThanhVien(MaThe,ANhanVienId,Islock, ANhanVienId_NhanVienCap,ACuaHangId) values(@mathe," + ndnewid + ",0, " + ANhanVienId_NhanVienCap + "," + MySession.Current.SSCuaHangId + ") ";
        Hashtable hsATheThanhVien = new Hashtable();
        hsATheThanhVien["mathe"] = madangky;
        ArrayListSQL.Add(sql2);
        ArrayListSQLHashTable.Add(hsATheThanhVien);
     
       

        string sqlsub = "(select id from athethanhvien where MaThe=@mathe)";
        Hashtable hsmathe = new Hashtable();
        hsmathe["mathe"] = madangky;
        string sql2Anhanvien = "UPDATE [Anhanvien] " +
        " SET [ATheThanhVienId] =" + sqlsub +
        " WHERE guid_id='" + guidid + "'";

        ArrayListSQL.Add(sql2Anhanvien);
        ArrayListSQLHashTable.Add(hsmathe);
        if (myUti.InsertTrans(ArrayListSQL, ArrayListSQLHashTable, "barcodenew") == "0")
        {
            SystemUti.Show("Đăng ký thất bại!");
            return;
        }
        Response.Redirect("Login.aspx");


//        MySession.Current.SSUsername = dtcheck.Rows[0]["Tendangnhap"].ToString();
//        MySession.Current.SSUserId = dtcheck.Rows[0]["Id"].ToString();
//        MySession.Current.SSUserFullName = dtcheck.Rows[0]["HoTen"].ToString();
//        MySession.Current.SSCuaHangId = DropDownList1.SelectedValue;
//        MySession.Current.SSTenCuaHang = DropDownList1.SelectedItem.Text;
//        if (Request["href"] != null)
//        {
//            Response.Redirect(Request["href"]);
//        }
//        else
//            Response.Redirect("AInfo.aspx");
    }
}