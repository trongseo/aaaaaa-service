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

public partial class BaoMatThe : CommonPageNhanVien
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;

       
        string idget = MySession.Current.SSUserId;

       
        if (idget!="")
        {
            DataRow drone = myUti.GetDataRow("Select * from Anhanvien where id=" + idget);
           
            TextBoxTenDangNhap.Text = drone["TenDangNhap"].ToString();
           
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string email = TextBoxMatKhau.Text.Trim();
        if (!kiemTraDuLieu())
        {
            SystemUti.Show("Mật khẩu cũ nhập sai!");
            return;
        }


            System.Collections.Hashtable hs = new Hashtable();
            hs["MatKhau"] = TextBoxMatKhau.Text.Trim();
            string sql = "UPDATE [ATheThanhVien] " +
            "SET islock =1" +
            " WHERE anhanvienid=" + MySession.Current.SSUserId;
            myUti.UpdateData(sql, null);

            SystemUti.ShowAndGo("Đã thông báo mất thành công!","Login.aspx");
            return;

    }

    bool kiemTraDuLieu()
    {
       //TextBoxMatKhau.Text
        System.Collections.Hashtable hs = new Hashtable();
        hs["MatKhau"] = TextBoxMatKhau.Text.Trim();
        DataRow drc = myUti.GetDataRowNull("Select * from anhanvien where MatKhau=@MatKhau and id=" + MySession.Current.SSUserId, hs);
        if (drc==null)
        {
             return false;
        }
        return true;
    }
}