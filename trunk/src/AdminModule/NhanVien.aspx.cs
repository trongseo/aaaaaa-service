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

public partial class AdminModule_NhanVien : CommonPageFree
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
 //       SELECT [Id]
 //     ,[CName]
 //     ,[CType]
 //     ,[OrdNumber]
 //     ,[CId]
 // FROM  [AConst]
 //where ctype=1
        DataTable dtc = myUti.GetDataTable("Select CName AS title,CId AS id from AConst where ctype=1");
        DropDownListAPhanCapId.DataSource = dtc;
        DropDownListAPhanCapId.DataTextField = "title";
        DropDownListAPhanCapId.DataValueField = "id";
        DropDownListAPhanCapId.DataBind();

        DataTable dtc2 = myUti.GetDataTable("Select CName AS title,CId AS id from AConst where ctype=2");
        DropDownListALoaiThanhVienId.DataSource = dtc2;
        DropDownListALoaiThanhVienId.DataTextField = "title";
        DropDownListALoaiThanhVienId.DataValueField = "id";
        DropDownListALoaiThanhVienId.DataBind();


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        string email = TextBoxEmail.Text.Trim();
        if (!kiemTraDuLieu())
        {
            return;
        }
           

            string sql = " insert into ANhanVien(acuahangid,mavach) values( "+ MySession.Current.SSCuaHangId + ",'') ";
            string myid = HiddenFieldId.Value;
            if (myid == "")
            {
                myid = myUti.InsertData(sql, null);
            }
            
            System.Collections.Hashtable hs = new Hashtable();



            hs["TenDangNhap"] = TextBoxTenDangNhap.Text.Trim();
            hs["MatKhau"] = TextBoxMatKhau.Text.Trim();
            hs["SDT"] = TextBoxSDT.Text.Trim();
            hs["Email"] = TextBoxEmail.Text.Trim();
            hs["HoTen"] = TextBoxHoTen.Text.Trim();
            hs["ThauChi"] = TextBoxThauChi.Text.Trim();
            hs["CMND"] = TextBoxCMND.Text.Trim();
            hs["CongViec"] = TextBoxCongViec.Text.Trim();
            hs["DiaChi"] = TextBoxDiaChi.Text.Trim();
            hs["MaVach"] = "11";
            hs["NgaySinh"] = "2014-12-12";
            int isgioitinh = 0;
            if (RadioButtonNam.Checked)
            {
                isgioitinh = 1;
            } 
            sql = "UPDATE [ANhanVien] " +
            " SET [TenDangNhap] =@TenDangNhap" +

             " ,[MatKhau] =@MatKhau" +
              " ,[SDT] =@SDT" +
               " ,[Email] =@Email" +
                " ,[HoTen] =@HoTen" +
                 " ,[ThauChi] =@ThauChi" +
                  " ,[CMND] =@CMND" +
                   " ,[CongViec] =@CongViec" +
                    " ,[DiaChi] =@DiaChi" +
                     " ,[MaVach] =@MaVach" +
                      " ,[GioiTinh] =" + isgioitinh +
               " ,[APhanCapId] =" + DropDownListAPhanCapId.SelectedValue +
                 " ,[ALoaiThanhVienId] =" + DropDownListALoaiThanhVienId.SelectedValue +
            ",NgaySinh =@NgaySinh " +
            " WHERE id=" + myid;
            myUti.UpdateData(sql, hs);

            return;
        

    }

    bool kiemTraDuLieu()
    {
        string idmember = HiddenFieldId.Value;
        if (HiddenFieldId.Value == "")
        {
            bool emailis = myUti.CheckExist("TenDangNhap", "ANhanVien", TextBoxTenDangNhap.Text.Trim());
            if (emailis)
            {
                SystemUti.Show("Ten Dang Nhap đã tồn tại!");
                return false;
            }
            emailis = myUti.CheckExist("Email", "ANhanVien", TextBoxEmail.Text.Trim());
            if (emailis)
            {
                SystemUti.Show("Email đã tồn tại!");
                return false;
            }
            emailis = myUti.CheckExist("SDT", "ANhanVien", TextBoxSDT.Text.Trim());
            if (emailis)
            {
                SystemUti.Show("SDT đã tồn tại!");
                return false;
            }
        }
        else
        {
            bool emailis = myUti.CheckExistKhachId("TenDangNhap", "ANhanVien", TextBoxTenDangNhap.Text.Trim(), idmember);
            if (emailis)
            {
                SystemUti.Show("Ten Dang Nhap đã tồn tại!");
                return false;
            }
            emailis = myUti.CheckExistKhachId("Email", "ANhanVien", TextBoxEmail.Text.Trim(), idmember);
            if (emailis)
            {
                SystemUti.Show("Email đã tồn tại!");
                return false;
            }
            emailis = myUti.CheckExistKhachId("SDT", "ANhanVien", TextBoxSDT.Text.Trim(), idmember);
            if (emailis)
            {
                SystemUti.Show("SDT đã tồn tại!");
                return false;
            }
        }
        

        //emailis = myUti.CheckExist("MaVach", "ANhanVien", TextBoxCMND.Text.Trim());
        //if (emailis)
        //{
        //    SystemUti.Show("CMND đã tồn tại!");
        //    return false;
        //}

        //emailis = myUti.CheckExist("CMND", "ANhanVien", TextBoxCMND.Text.Trim());
        //if (emailis)
        //{
        //    SystemUti.Show("CMND đã tồn tại!");
        //    return false;
        //}
       
        return true;
    }
}