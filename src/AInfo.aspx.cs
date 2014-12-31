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
    public string isShow(string pannelid)
    {
        if (pannelid == "well1")
        {
            if (MySession.Current.SSAPhanCapId == Constants.PhanCap_nhanvien)
            {
                return "display:none";

            }
            else
            {
                return "";
            }

        }
        if (pannelid == "well1nhanvien")
        {
            if (MySession.Current.SSAPhanCapId == Constants.PhanCap_nhanvien)
            {
                return "";

            }
            else
            {
                return "display:none";
            }

        }
        
        return "";
    }
    public string nhanvienVaoca = "";
    void kiemTraTheThanhVien()
    {
        HyperLinkThe.NavigateUrl = "BaoMatThe.aspx";
        HyperLinkThe.Text = "Báo mất thẻ";

      //  if (MySession.Current.SSAPhanCapId == Constants.PhanCap_Nguoidung)
       // {

            HyperLinkThe.NavigateUrl = "BaoMatThe.aspx";
            HyperLinkThe.Text = "Báo mất thẻ";

            string sql = "select athethanhvienid from anhanvien where id=" + MySession.Current.SSUserId;
            var drn = myUti.GetDataRowNull(sql);
            if (drn["athethanhvienid"].ToString()=="")
            {
                HyperLinkThe.NavigateUrl = "capthemoi.aspx";
                HyperLinkThe.Text = "Lấy thẻ thành viên";
            }
            if (drn != null)
            {
                string slx = "Select Islock from Athethanhvien where id=" + drn[0].ToString();
              string islock =   myUti.GetOneField(slx);
              if (islock=="1")
              {
                  HyperLinkThe.NavigateUrl = "caplaithe.aspx";
                  HyperLinkThe.Text = "Cấp lại thẻ";
              }
               
            }
           
      //  }
       //chua cap lan nao, da cap,lam the moi

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
       

        if (GetPara("from")=="hoanthanh")
        {
            ButtonHoanThanh();
            return;
        }
        showVaoCaTanCa();
        kiemTraTheThanhVien();
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

        //DropDownListAport.Items.Insert(0, new ListItem("...Chọn..", ""));
        //DropDownListAport.SelectedIndex = 0;


        //loai dich vu
        DataTable dtcdv = myUti.GetDataTable("Select title AS title,id AS id from ADanhMucDv where acuahangid=" + MySession.Current.SSCuaHangId);

        DropDownListLoaiDV.DataSource = dtcdv;
        DropDownListLoaiDV.DataTextField = "title";
        DropDownListLoaiDV.DataValueField = "id";
        DropDownListLoaiDV.DataBind();

        DropDownListLoaiDV.Items.Insert(0, new ListItem("...Chọn..", "0"));
        DropDownListLoaiDV.SelectedIndex = 0;
    }

    public void showVaoCaTanCa()
    {
        if (MySession.Current.SSAPhanCapId != Constants.PhanCap_nhanvien)
        {
            return;
        }
        //[YYYY.MM.DD]
        string checktoday = "select Id from ALichSuVaoRaNV where Athanhvienid='" + MySession.Current.SSUserId + "' and CONVERT(VARCHAR(10), getdate(), 102) = CONVERT(VARCHAR(10), date_login, 102) ";
        var drd = myUti.GetDataRowNull(checktoday);
        var guidid = myUti.GetGuid_Id();
        if (drd == null)
        {
            string sqlinsert = " insert into ALichSuVaoRaNV([guid_id],[Athanhvienid],[date_login],[ip],[Iscard],[date_create],[ACuaHangId]) values('" + guidid + "'," + MySession.Current.SSUserId + ",getdate(),'" + SystemUti.GetUser_IP() + "',11,getdate()," + MySession.Current.SSCuaHangId + ")";
            myUti.ExecuteSql(sqlinsert);
        }
        else {
            //string sqlupdate = " update ALichSuVaoRa set  date_logout=getdate(),ip='" + SystemUti.GetUser_IP() + "' where id=" + drd["Id"].ToString();
            //myUti.ExecuteSql(sqlupdate);
        }
        var drgg = myUti.GetDataRow("Select date_login,date_logout from ALichSuVaoRaNV where Athanhvienid='" + MySession.Current.SSUserId + "' and CONVERT(VARCHAR(10), getdate(), 102) = CONVERT(VARCHAR(10), date_login, 102) ");

        LabelGioVao.Text = "Vào ca:"+SystemUti.formatDateShowHHmm(drgg["date_login"]);
        if (drgg["date_logout"] != null)
        {
            LabelTanca.Text = "Tan ca:" + SystemUti.formatDateShowHHmm(drgg["date_logout"]);
        }
        else
        {
            LabelTanca.Text = "Tan ca:...";
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        //string sqlupdate = " update ALichSuVaoRaNV set  date_logout=getdate(),ip='" + SystemUti.GetUser_IP() + "' where Athanhvienid=" + MySession.Current.SSUserId;
        //myUti.ExecuteSql(sqlupdate);
        //Response.Redirect("Ainfo.aspx");

    }

   
    protected void ButtonHoanThanh()
    {
        
        if (kiemTraTien(MySession.Current.SSUserId) < 0)
        {
            SystemUti.Show("Không còn đủ tiền để hoàn thành đơn hàng này.Vui lòng nạp thêm tiền hoặc bỏ bớt dịch vụ!");
            return;
        }
        string guidgiohang = MySession.Current.SSGuidGioHang;
        string userid = MySession.Current.SSUserId;
        string SSCuaHangId = MySession.Current.SSCuaHangId; 
        string sql1 = " update agiohangtemp set adonhang_guid_id='" + guidgiohang + "'  where guid_giohang='" + guidgiohang + "'";
        string madonhang = DateTime.Now.ToString("MMddHHmmss") + MySession.Current.SSUserId;
           
            string sqlxd = "  INSERT INTO [dbo].[ADonHang]( [guid_id] ,[Athanhvienid],[ACuaHangId],[MaDonHang])   VALUES('" + guidgiohang + "'," + MySession.Current.SSUserId + "," + MySession.Current.SSCuaHangId + ",'" + madonhang + "')";


            string sql1x = " select sum(soluong*giathanh) from agiohangtemp where    guid_giohang='" + guidgiohang + "'";
            string SotienMuahang = myUti.GetOneField(sql1x);
            string sqlinsertgiaodich = "INSERT INTO AGiaoDichNapTien(Ghichu,Adonhang_guid_id,[guid_id],[Athanhvienid],[Sotien],[ACuaHangId],[LoaiGiaoDich]) values(@Ghichu,'" + guidgiohang + "','" + guidgiohang + "'," + userid + ",-" + SotienMuahang + "," + SSCuaHangId + "," + Constants.GiaoDich_muahang + ")";
            System.Collections.Hashtable hsgiaodich = new Hashtable();
            hsgiaodich["Ghichu"] = "Mã đơn hàng:" + madonhang;
          
            string sqlCapNhatTaiKhoan = "UPDATE [ATaiKhoan] " +
         " SET [Sotien] =Sotien - " + SotienMuahang +
         " WHERE Athanhvienid=" + userid;
            ArrayList arsql = new ArrayList();
            arsql.Add(sql1);
            arsql.Add(sqlxd);
            arsql.Add(sqlinsertgiaodich);
            arsql.Add(sqlCapNhatTaiKhoan);
        
        
            ArrayList arHS = new ArrayList();
            arHS.Add(new Hashtable());
            arHS.Add(new Hashtable());
            arHS.Add(hsgiaodich);
            arHS.Add(new Hashtable());
            if (myUti.InsertTrans(arsql, arHS, "commitdonhang") == "0")
            {
                SystemUti.Show("Hoàn thành đơn hàng thất bại");
                return;
            }
            MySession.Current.SSGuidGioHang = null;
        //tru tien khach hang
            Response.Redirect("chitiethd.aspx?guid_id="+guidgiohang);

    }
    protected void ButtonNapTien_Click(object sender, EventArgs e)
    {
        string manaptien = TextBoxMaNapTien.Text;
       /// kiem tra nhap qua nhieu
        string sqlchecklan = "Select date_live from anhanvien where id="+ MySession.Current.SSUserId +" and date_live<getdate()";
        var drchecklive = myUti.GetDataRowNull(sqlchecklan);
        if (drchecklive==null)
        {
             SystemUti.Show("Chức năng nhập thẻ cáo bị khóa trong 15 phút.Vì bạn đã nhập sai quá 5 lần.");

              return;
        }

        Hashtable hs22 = new Hashtable();
        hs22["manaptien"] = SystemUti.md5(manaptien);
        var drgia = myUti.GetDataRowNull("Select * from Athecao where sothecao=@manaptien and isfinish=0 and islock=0 and ngaybatdau<= getdate() and ngayketthuc >=getdate() ", hs22);
      if (drgia==null)
      {
          MySession.Current.SSSoLanSai = MySession.Current.SSSoLanSai+1;
          if (MySession.Current.SSSoLanSai > 5)
          {
              string sqlupdateliveupdate = "update anhanvien set date_live=DATEADD(minute,15,GETDATE()) where id=" + MySession.Current.SSUserId + "";
              myUti.ExecuteSql(sqlupdateliveupdate);
              SystemUti.Show("Chức năng nhập thẻ cáo bị khóa trong 15 phút.Vì bạn đã nhập sai quá 5 lần.");
              MySession.Current.SSSoLanSai = 0;
              return;
          }
          SystemUti.Show("Thẻ cào sai ( lần " + MySession.Current.SSSoLanSai + "/5)hoặc đã hết hạn!Vui lòng kiểm tra lại.");
          
          return;
      }
       // date_live
          
      string giatien = drgia["gia"].ToString(); 
        string Athanhvienid = MySession.Current.SSUserId;
        string guid = myUti.GetGuid_Id();
        string sql = " insert into aGiaodichnaptien(guid_id) values('" + guid + "') ";
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
        hs["Ghichu"] = "Nap tien:"+manaptien;
        sql = "UPDATE [AGiaoDichNapTien] " +
        " SET [Ghichu] =@Ghichu" +
         " ,[Sotien] = " + giatien +
           " ,[loaigiaodich] = " + Constants.GiaoDich_napthecao +
          " ,[Athanhvienid] = " + Athanhvienid +
            " ,[ACuaHangId] = " + MySession.Current.SSCuaHangId +
        " WHERE id=" + myid;
        myUti.UpdateData(sql, hs);
        ArrayList ArrayListSQL = new ArrayList();
        ArrayListSQL.Add(sql);
        ArrayList ArrayListSQLHashTable = new ArrayList();
        ArrayListSQLHashTable.Add(hs);

        string sql2 = "UPDATE [ATaiKhoan] " +
        " SET [Sotien] =Sotien+ " +giatien+
            //  " ,[Athanhvienid] = " + DropDownList1.SelectedValue.Trim() +
        " WHERE Athanhvienid=" + Athanhvienid;
        var hs2 = new Hashtable();

        string sqlAthecao = "UPDATE [Athecao] " +
        " SET [isfinish] =1 " +
             " ,[islock] = 1,NgayNap=getdate()" +
        " WHERE id=" + drgia["id"].ToString();

        ArrayListSQL.Add(sql2);
        ArrayListSQLHashTable.Add(hs2);

        ArrayListSQL.Add(sqlAthecao);
        ArrayListSQLHashTable.Add(new Hashtable());

        if (myUti.InsertTrans(ArrayListSQL, ArrayListSQLHashTable, "naptienthe") == "0")
        {
            SystemUti.Show("Bị lỗi khi nạp tiền");
        }
        else
        {
            //SystemUti.Show("Đã nạp thành công[" + giatien + "] vào tài khoản.", "window.location.href='Ainfo.aspx'");
            Response.Redirect("Ainfo.aspx");
        }
       // Response.Redirect("Ainfo.aspx");
      

    }
    protected void ButtonGuiDo_Click(object sender, EventArgs e)
    {
        MY_HASTABLE["madonhang"] = TextBoxmadonhang_guitra.Text;
     var drn=   myUti.GetDataRowNull("Select guid_id from adonhang where madonhang=@madonhang", MY_HASTABLE);
     if (drn== null)
        {
            SystemUti.Show("Không tồn tại đơn hàng này!");
            return;
        }
       
    
        var guid_id = drn["guid_id"].ToString();
         MySession.Current.SSguid_id_donhang = guid_id;
         Response.Redirect("guido.aspx");
    }
    protected void ButtonTraDo_Click(object sender, EventArgs e)
    {
        MY_HASTABLE["madonhang"] = TextBoxmadonhang_guitra.Text;
        var drn = myUti.GetDataRowNull("Select guid_id from adonhang where madonhang=@madonhang", MY_HASTABLE);
        if (drn == null)
        {
            SystemUti.Show("Không tồn tại đơn hàng này!");
            return;
        }

        var guid_id = drn["guid_id"].ToString();
        MySession.Current.SSguid_id_donhang = guid_id;
        Response.Redirect("trado.aspx");
    }
    protected void ButtonNhanViennaptien_Click(object sender, EventArgs e)
    {
        string manhanvien = TextBoxbarcodenhanvien.Text.Trim();
      // TextBoxSoTienNap.Text;
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


        ArrayList ArrayListSQL = new ArrayList();
       
        ArrayList ArrayListSQLHashTable = new ArrayList();
      
        //checkkk
        string Sotien = TextBoxSoTienNap.Text;
        string loginid = MySession.Current.SSUserId;
        //update lich su tien,update vao tai khoan
        string guid = myUti.GetGuid_Id();
        string sql = " insert into aGiaodichnaptien(guid_id,Athanhvienid,Sotien,ANhanvienidNap,ACuaHangId,Ghichu,LoaiGiaoDich) values('" + guid + "'," + loginid + "," + Sotien + "," + dtcheck.Rows[0]["Id"].ToString() + "," + dtcheck.Rows[0]["ACuaHangId"].ToString() + ",'Nap tien:" + Sotien + "',"+Constants.GiaoDich_naptien+") ";
        System.Collections.Hashtable hsKhachang = new Hashtable();
        ArrayListSQL.Add(sql);
        ArrayListSQLHashTable.Add(hsKhachang);
        string sqlATaiKhoankh = "UPDATE [ATaiKhoan] " +
       " SET [Sotien] =Sotien+ " + Sotien.Trim() +
       " WHERE Athanhvienid=" + loginid;
        var hssqlATaiKhoankh = new Hashtable();
        ArrayListSQL.Add(sqlATaiKhoankh);
        ArrayListSQLHashTable.Add(hssqlATaiKhoankh);

        //tru tien nhan vien
        string sqlnhanvien = " insert into aGiaodichnaptien(guid_id,Athanhvienid,Sotien,ACuaHangId,ANhanvienidNap,Ghichu,LoaiGiaoDich) values('" + guid + "'," + dtcheck.Rows[0]["Id"].ToString() + ",-" + Sotien + "," + dtcheck.Rows[0]["ACuaHangId"].ToString() + ","+loginid+",'Nap tien cho khach:-" + Sotien + "'," + Constants.GiaoDich_naptien + ") ";
        System.Collections.Hashtable hsnvtru = new Hashtable();
        ArrayListSQL.Add(sqlnhanvien);
        ArrayListSQLHashTable.Add(hsnvtru);
        string sqlATaiKhoannv = "UPDATE [ATaiKhoan] " +
       " SET [Sotien] =Sotien- " + Sotien.Trim() +
       " WHERE Athanhvienid=" + dtcheck.Rows[0]["Id"].ToString();
        var hssqlATaiKhoannv = new Hashtable();
        ArrayListSQL.Add(sqlATaiKhoannv);
        ArrayListSQLHashTable.Add(hssqlATaiKhoannv);

       
      var kr= myUti.InsertTrans(ArrayListSQL, ArrayListSQLHashTable, "CNAPTIENTAIKHOAN");
      if (kr == "0")
      {
          SystemUti.Show("Nạp tiền không thành công!");
      }else
          {
              SystemUti.ShowAndGo("Nạp tiền thành công!","Default.aspx");
          }

    }
    protected void ButtonTanCa_Click(object sender, EventArgs e)
    {
        string sqlupdate = " update ALichSuVaoRaNV set  date_logout=getdate(),ip='" + SystemUti.GetUser_IP() + "' where Athanhvienid=" + MySession.Current.SSUserId;
        myUti.ExecuteSql(sqlupdate);
        Response.Redirect("Ainfo.aspx");
    }
}