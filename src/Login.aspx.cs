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

public partial class Login : CommonPageN
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
        //Member mb = MemberManager.GetMemberFromUserNameAndPass(UserTextBox.Text, MyUtilities.HashPassWord(PassTextBox.Text));
        System.Collections.Hashtable hs = new Hashtable();
        hs["Username"] = UserTextBox.Text.Trim();
        hs["HashedPassword"] = PassTextBox.Text;
        DataTable dt = myUti.GetDataTable("Select * from Anhanvien where Tendangnhap=@Username and MatKhau=@HashedPassword", hs);
        if (dt.Rows.Count == 0)
        {
            Label1.Visible = true;
        }
        else
        {
         
            MySession.Current.SSUsername = dt.Rows[0]["Tendangnhap"].ToString();
             MySession.Current.SSUserId = dt.Rows[0]["Id"].ToString();
             MySession.Current.SSUserFullName = dt.Rows[0]["HoTen"].ToString();
             MySession.Current.SSCuaHangId = DropDownList1.SelectedValue;
             MySession.Current.SSTenCuaHang = DropDownList1.SelectedItem.Text;
             if (Request["href"] != null) 
             {
                 Response.Redirect(Request["href"]);
             }else
                 Response.Redirect("AInfo.aspx");
        }
    }
    protected void ButtonLoginBarcode_Click(object sender, EventArgs e)
    {
        string barcodestr = TextBoxBarcode.Text;
        MY_HASTABLE["mathe"] = barcodestr;
        string sqlg = @"SELECT        ANhanVien.ACuaHangId, ANhanVien.TenDangNhap, ANhanVien.SDT, ANhanVien.HoTen, ANhanVien.Id, ATheThanhVien.MaThe
FROM            ATheThanhVien INNER JOIN
                         ANhanVien ON ATheThanhVien.ANhanVienId = ANhanVien.Id
WHERE        (ATheThanhVien.Islock = 0) AND (ATheThanhVien.MaThe =@MaThe)";
        var dtcheck =  myUti.GetDataTable(sqlg, MY_HASTABLE);
        if (dtcheck.Rows.Count==0)
        {
            SystemUti.Show("Barcode bị sai hoặc đã bị khóa!");
            return;
        }

        MySession.Current.SSUsername = dtcheck.Rows[0]["Tendangnhap"].ToString();
        MySession.Current.SSUserId = dtcheck.Rows[0]["Id"].ToString();
        MySession.Current.SSUserFullName = dtcheck.Rows[0]["HoTen"].ToString();
        MySession.Current.SSCuaHangId = DropDownList1.SelectedValue;
        MySession.Current.SSTenCuaHang = DropDownList1.SelectedItem.Text;
        if (Request["href"] != null)
        {
            Response.Redirect(Request["href"]);
        }
        else
            Response.Redirect("AInfo.aspx");
    }
}