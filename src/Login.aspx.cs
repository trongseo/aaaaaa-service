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
using System.Net;
using System.IO;

public partial class Login : CommonPageN
{
    protected string GetUser_IP()
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }

        return context.Request.ServerVariables["REMOTE_ADDR"];
    
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        Session.Clear();
        string myip = GetUser_IP();
        Response.Write(myip);
        DataTable dtc = myUti.GetDataTable("Select TenCuaHang AS title,id AS id from ACuaHang where ip='"+myip+"'");
        if (dtc.Rows.Count==0)
        {
            dtc = myUti.GetDataTable("Select TenCuaHang AS title,id AS id from ACuaHang ");
        }
        DropDownList1.DataSource = dtc;
        DropDownList1.DataTextField = "title";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();

         if (Request.Cookies["Achuahangid"] != null) {
             var value = Request.Cookies["Achuahangid"].Value;
             DropDownList1.SelectedValue = value;
        } 

        if (GetPara("from") == "logout")
        {
            
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

            //kiem tra xem nhan vien co thuoc cua hang nay khong
            if (dt.Rows[0]["APhanCapId"].ToString() == Constants.PhanCap_nhanvien)
            {
                string ACuaHangId = dt.Rows[0]["ACuaHangId"].ToString();
                if (ACuaHangId != DropDownList1.SelectedValue)
                {
                    SystemUti.Show("Nhân viên này không phải cửa hàng này!");
                    return;
                }
            }
            MySession.Current.SSAPhanCapId = dt.Rows[0]["APhanCapId"].ToString();
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
        string sqlg = @"SELECT        ANhanVien.ACuaHangId,APhanCapId, ANhanVien.TenDangNhap, ANhanVien.SDT, ANhanVien.HoTen, ANhanVien.Id, ATheThanhVien.MaThe
FROM            ATheThanhVien INNER JOIN
                         ANhanVien ON ATheThanhVien.ANhanVienId = ANhanVien.Id
WHERE        (ATheThanhVien.Islock = 0) AND (ATheThanhVien.MaThe =@MaThe)";
        var dtcheck =  myUti.GetDataTable(sqlg, MY_HASTABLE);
        if (dtcheck.Rows.Count==0)
        {
            SystemUti.Show("Barcode bị sai hoặc đã bị khóa!");
            return;
        }
        //kiem tra xem nhan vien co thuoc cua hang nay khong
        if ( dtcheck.Rows[0]["APhanCapId"].ToString()==Constants.PhanCap_nhanvien)
        {
            string ACuaHangId = dtcheck.Rows[0]["ACuaHangId"].ToString();
            if (ACuaHangId != DropDownList1.SelectedValue)
            {
                SystemUti.Show("Nhân viên này không phải của cửa hàng này!");
                return;
            }
        }

        MySession.Current.SSUsername = dtcheck.Rows[0]["Tendangnhap"].ToString();
        MySession.Current.SSUserId = dtcheck.Rows[0]["Id"].ToString();
        MySession.Current.SSUserFullName = dtcheck.Rows[0]["HoTen"].ToString();
        MySession.Current.SSCuaHangId = DropDownList1.SelectedValue;
        MySession.Current.SSTenCuaHang = DropDownList1.SelectedItem.Text;
        MySession.Current.SSAPhanCapId = dtcheck.Rows[0]["APhanCapId"].ToString();
        HttpCookie cookie = new HttpCookie("Achuahangid");

        //Set the cookies value
        cookie.Value = DropDownList1.SelectedValue;

        //Set the cookie to expire in 1 minute
       
        cookie.Expires = new DateTime(2030, 1, 1);

        //Add the cookie
        Response.Cookies.Add(cookie);

        if (Request["href"] != null)
        {
            Response.Redirect(Request["href"]);
        }
        else
            Response.Redirect("AInfo.aspx");
    }
}