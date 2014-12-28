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

public partial class dieukhienend : CommonPageNhanVien
{

    public DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (IsPostBack)
        {
            return;
        }
     
     
                    //kiem tra nhan vien xem co dang o cua hang khong
        if (MySession.Current.SSAPhanCapId != Constants.PhanCap_nhanvien)
        {
            SystemUti.ShowAndGo("Chỉ có nhân viên đang ở tại của hàng mới dùng được trang này!","Ainfo.aspx");
            return;
        }
        //if (MySession.Current.SSCuaHangIp != SystemUti.GetUser_IP())
        //{
        //    SystemUti.ShowAndGo("Chỉ có nhân viên đang ở tại cửa hàng mới dùng được trang này !", "Ainfo.aspx");
        //    return;
        //}


        string getguid = GetPara("guid_dichvu");
        //kiem tra ton tai va chua ketthuc
        string sqlcheckin = "SELECT id,guid_id,date_on,date_off,port_number,acuahangid,anhanvienid,guid_id_dichvu_giohang,date_create,date_update,isget,isfinish  FROM AHisPort where isfinish=0 and guid_id_dichvu_giohang=@guid_id_dichvu_giohang";
        MYHASTABLE["guid_id_dichvu_giohang"] = getguid;
        var drhisport = myUti.GetDataRowNull(sqlcheckin,MYHASTABLE);
        string guid_hisport = myUti.GetGuid_Id();
        if (drhisport==null)
        {
            string sqlinserthisport = " INSERT INTO AHisPort(guid_id,acuahangid,anhanvienid,guid_id_dichvu_giohang,isfinish) VALUES('" + guid_hisport + "',"+MySession.Current.SSCuaHangId+","+MySession.Current.SSUserId+",'" + getguid + "',0);";
            myUti.ExecuteSql(sqlinserthisport);
            Response.Redirect("dieukhien.aspx?guid_hisport=" + guid_hisport + "&guid_dichvu=" + getguid);
            return;
        }
        //
        Label1.Text =  drhisport["port_number"].ToString();
        HiddenField1.Value = drhisport["port_number"].ToString();
        HiddenFieldguid_histport.Value = drhisport["guid_id"].ToString(); 
        //  CASE WHEN isoff< 1 THEN N'Đang mở' ELSE N'Đang tắt' END AS ColumnName
       

        string sql = @" SELECT        guid_id, ngay, gio, loai, idsp as title, isdichvu, aportid AS sttmay, soluong, giathanh, acuahangid, anhanvienid, adonhang_guid_id, date_create, guid_giohang, 
                         soluong * giathanh AS thanhtien
FROM            AGioHangTemp ";
        sql += " where guid_id='" + getguid + "' ";
        DRView = myUti.GetDataTable(sql, null).Rows[0];
        
    }
    public DataRow DRView;
    public string getSPorDV(object oidspdv, object isdichvu)
    {
        string idspdv = oidspdv.ToString();
        string isdv = isdichvu.ToString();
        if (isdv != "1")
        {

            return myUti.GetOneField("Select title from spweb where id=" + idspdv);
        }
        else
        {
            string sqlx = @"
SELECT        ADanhMucDV.Title + cast( ADichVu.SoPhut as varchar)+N' Phút'
FROM            ADichVu INNER JOIN
                         ADanhMucDV ON ADichVu.ADanhMucDVId = ADanhMucDV.Id";
            sqlx += " where ADichVu.id=" + idspdv;
            return myUti.GetOneField(sqlx);
        }
    }
    public string getMadonhang(object oidspdv)
    {

        string guid_donhang = oidspdv.ToString();
        return myUti.GetOneField("Select madonhang from ADonHang where guid_id='" + guid_donhang + "'");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        
            string sqlxx = "update aport set isoff =1,isget=1 where id=" + HiddenField1.Value + " and acuahangid=" + MySession.Current.SSCuaHangId;
           // Response.Write(sqlxx);
           myUti.ExecuteSql(sqlxx);

           string sqlx = "update AHisPort set date_off=getdate(),isget=1,isfinish=1   where guid_id='" + HiddenFieldguid_histport.Value + "'";
           myUti.ExecuteSql(sqlx);   
        Response.Redirect("dieukhienthietbi.aspx?mess=Đã điều khiển chuyển trạng thái!");
           
       
    }
}