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
    protected void Button1_Click(object sender, EventArgs e)
    {
      
       

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
        Hashtable hs22 = new Hashtable();
        hs22["manaptien"] = manaptien;
        var drgia = myUti.GetDataRowNull("Select * from Athecao where sothecao=@manaptien and isfinish=0 and islock=0 and ngaybatdau<= getdate() and ngayketthuc >=getdate() ", hs22);
      if (drgia==null)
      {
          SystemUti.Show("Thẻ cào sai hoặc đã hết hạn!Vui lòng kiểm tra lại.");
          return;
      }
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
}