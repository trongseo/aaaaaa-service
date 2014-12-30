﻿using System;
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


        DataTable dtcquan = myUti.GetDataTable(" Select TenQuan AS title,Id AS id from AQuan order by stt ");
        DropDownListQuan.DataSource = dtcquan;
        
        DropDownListQuan.DataTextField = "title";
        DropDownListQuan.DataValueField = "id";
        DropDownListQuan.DataBind();
        DropDownListQuan.Items.Insert(0, new ListItem(String.Empty, ""));
        DropDownListQuan.SelectedIndex = 0;
        string idget  =   GetPara("Id");
        HiddenFieldId.Value=idget;
        if (idget!="")
        {
            DataRow drone = myUti.GetDataRow("Select * from Anhanvien where id=" + idget);
            DropDownListALoaiThanhVienId.SelectedValue = drone["ALoaiThanhVienId"].ToString();
            DropDownListAPhanCapId.SelectedValue = drone["APhanCapId"].ToString();
            DropDownListQuan.SelectedValue = drone["QuanId"].ToString();
            TextBoxCMND.Text = drone["APhanCapId"].ToString();
            TextBoxTenDangNhap.Text = drone["TenDangNhap"].ToString();
            TextBoxMatKhau.Text = drone["MatKhau"].ToString();
            TextBoxSDT.Text = drone["SDT"].ToString();
            TextBoxEmail.Text = drone["Email"].ToString();
            TextBoxHoTen.Text = drone["HoTen"].ToString();
            TextBoxThauChi.Text = drone["ThauChi"].ToString();
            TextBoxCMND.Text = drone["CMND"].ToString();
            TextBoxCongViec.Text = drone["CongViec"].ToString();
            TextBoxDiaChi.Text = drone["DiaChi"].ToString();
            string dateSinh = drone["NgaySinh"].ToString();
            if (dateSinh != "")
            {
               dateSinh = ((DateTime)drone["NgaySinh"]) .ToString("dd-MM-yyyy");
            }
            TextBoxNgaySinh.Text = dateSinh;
            string isgioitinh = drone["GioiTinh"].ToString();
            if (isgioitinh == "1")
            {
                RadioButtonNam.Checked = true;
                RadioButtonNu.Checked = false;
            }
            else
            {
                RadioButtonNam.Checked = false;
                RadioButtonNu.Checked = true;
            }
          
           // hs["MaVach"] = "11";
            //TextBoxNgaySinh.Text = drone["DiaChi"].ToString();

          //  DropDownListQuan.SelectedValue = drone["QuanId"].ToString();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      
        string email = TextBoxEmail.Text.Trim();
        if (!kiemTraDuLieu())
        {
            return;
        }
           

            string sql = " insert into ANhanVien(acuahangid) values( "+ MySession.Current.SSCuaHangId + ") ";
            string myid = HiddenFieldId.Value;
            if (myid == "")
            {
                myid = myUti.InsertData(sql, null);
                string guidid = myUti.GetGuid_Id();
                myUti.InsertData("insert into AtaiKhoan(guid_id,athanhvienid) values('" + guidid + "'," + myid + ");");
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
            string nsinh = "";
            if (TextBoxNgaySinh.Text.Trim() != "")
            {
                hs["NgaySinh"] = nsinh;
                nsinh = SystemUti.ConverDDMMYYYYtoYYYYMMDD(TextBoxNgaySinh.Text.Trim());
                sql = "UPDATE [ANhanVien] " +
            "SET NgaySinh = '" + nsinh + "'" +
            " WHERE id=" + myid;
                myUti.UpdateData(sql, hs);

            }
            else
            {
                sql = "UPDATE [ANhanVien] " +
               "SET NgaySinh = null "  +
               " WHERE id=" + myid;
                myUti.UpdateData(sql, hs);
            }

            if (DropDownListQuan.SelectedValue != "")
            {
                sql = "UPDATE [ANhanVien] " +
            "SET QuanId = " + DropDownListQuan.SelectedValue +
            " WHERE id=" + myid;
                myUti.UpdateData(sql, hs);

            }
            else
            {
                sql = "UPDATE [ANhanVien] " +
          "SET QuanId =null " + 
          " WHERE id=" + myid;
                myUti.UpdateData(sql, hs);
            }

           
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
                   
                      " ,[GioiTinh] =" + isgioitinh +
               " ,[APhanCapId] =" + DropDownListAPhanCapId.SelectedValue +
                 " ,[ALoaiThanhVienId] =" + DropDownListALoaiThanhVienId.SelectedValue +
            " WHERE id=" + myid;
            myUti.UpdateData(sql, hs);

        
            Response.Redirect("NhanVienList.aspx");
        

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