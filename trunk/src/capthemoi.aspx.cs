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

public partial class capthemoi : CommonPageNhanVien
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

        
        string ndnewid = MySession.Current.SSUserId;
           ////////////////// //////////////////
        float SotienMuahang = 0;
        // tru tien khach hang
        //if (tienTrongTK(MySession.Current.SSUserId) < SotienMuahang)
        //{
        //    SystemUti.ShowAndGo("Số tiền trong tài khoản của bạn < " + SotienMuahang + " đồng.Vui lòng nạp thêm tiền!", "Ainfo.aspx");
        //    return;
        //}

        string ANhanVienId_NhanVienCap = dtcheck.Rows[0]["Id"].ToString();
        string guid = myUti.GetGuid_Id();

        /////////////////////////////tru tien khach hang,cap nhat the thanh vien
        //them the moi
        string sql2 = " insert into ATheThanhVien(MaThe,ANhanVienId,Islock, ANhanVienId_NhanVienCap,ACuaHangId) values(@mathe," + ndnewid + ",0, " + ANhanVienId_NhanVienCap + "," + MySession.Current.SSCuaHangId + ") ";
        Hashtable hsATheThanhVien = new Hashtable();
        hsATheThanhVien["mathe"] = madangky;
        ArrayListSQL.Add(sql2);
        ArrayListSQLHashTable.Add(hsATheThanhVien);
     //cap nhat tai khoan
        string sqlCapNhatTaiKhoan = "UPDATE [ATaiKhoan] " +
         " SET [Sotien] =Sotien - " + SotienMuahang +
         " WHERE Athanhvienid=" + ndnewid;
        ArrayListSQL.Add(sqlCapNhatTaiKhoan);
        ArrayListSQLHashTable.Add(new Hashtable());
        //them giao dich
        string sqlinsertgiaodich = "INSERT INTO AGiaoDichNapTien(Ghichu,[guid_id],[Athanhvienid],[Sotien],[ACuaHangId],[LoaiGiaoDich]) values(@Ghichu,'" + guid + "'," + ndnewid + ",-" + SotienMuahang + "," + MySession.Current.SSCuaHangId + "," + Constants.GiaoDich_matthe + ")";
        System.Collections.Hashtable hsgiaodich = new Hashtable();
        hsgiaodich["Ghichu"] = "Thu thẻ thành viên:" + SotienMuahang;
        ArrayListSQL.Add(sqlinsertgiaodich);
        ArrayListSQLHashTable.Add(hsgiaodich);
      
        //cap nhat the thanh vien cho thanh vien

        string sqlthanhvien = " update  anhanvien set Athethanhvienid=" + ndnewid + " where id="+ndnewid;
        ArrayListSQL.Add(sqlthanhvien);
        ArrayListSQLHashTable.Add(new Hashtable());
      
      
        if (myUti.InsertTrans(ArrayListSQL, ArrayListSQLHashTable, "matbarcode") == "0")
        {
            SystemUti.Show("Việc cấp thẻ thất bại!Chúng tôi xin lỗi vì việc này.");
            return;
        }

        SystemUti.ShowAndGo("Cấp thẻ thành viên thành công.", "Login.aspx"); 


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