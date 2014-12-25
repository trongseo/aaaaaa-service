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

public partial class trado : CommonPageNhanVien
{

    public DataTable dt = new DataTable();
    public string datenhando="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        //khách hàng có giỏ hàng (idnhanvien,co gio hang chua hoan thanh(adonhang_guid_id==null la chua hoan thanh)
        string guid_giohang = "";
        if (GetPara("guid_id") == "")
        {
            guid_giohang = MySession.Current.SSguid_id_donhang;

        }
        else
        {
            guid_giohang = Request["guid_id"];
        }
        var drnu = myUti.GetDataRowNull("Select * from AGDNhanDo where guid_id='" + guid_giohang + "'");
        if (drnu != null)
        {
            TextBoxGhichu.Text = drnu["Ghichu"].ToString();
            datenhando = "Nhận đồ lúc:" + SystemUti.formatDateShowHHmm(drnu["date_nhan"]);
        }
       


        string sql = @" SELECT        guid_id, ngay, gio, loai, idsp as title, isdichvu, aportid AS sttmay, soluong, giathanh, acuahangid, anhanvienid, adonhang_guid_id, date_create, guid_giohang, 
                         soluong * giathanh AS thanhtien
FROM            AGioHangTemp ";
        sql += " where  adonhang_guid_id='" + guid_giohang + "' order by ngay";
        dt = myUti.GetDataTable(sql, null);



        //   data: 'DropDownListLoaiSP=' + loaisp +'&DropDownListSP=' + idsp +'TextBoxNgaySP=' + ngadv ,

        //  Response.Write(guid_giohang);
        // Session.Clear();
        return;






    }
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
SELECT        ADanhMucDV.Title + cast( ADichVu.SoPhut as varchar)+N'P'
FROM            ADichVu INNER JOIN
                         ADanhMucDV ON ADichVu.ADanhMucDVId = ADanhMucDV.Id";
            sqlx += " where ADichVu.id=" + idspdv;
            return myUti.GetOneField(sqlx);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string guid_donhang = "";
        if (GetPara("guid_id") == "")
        {
            guid_donhang = MySession.Current.SSguid_id_donhang;

        }
        else
        {
            guid_donhang = Request["guid_id"];
        }
        var drd = myUti.GetDataRowNull("select madonhang,athanhvienid from adonhang where guid_id='" + guid_donhang + "'",null);
        var madonhang = drd["madonhang"].ToString();
        var athanhvienid = drd["athanhvienid"].ToString();
        string sqlx = "update   AGDNhanDo set date_tra=getdate(),Ghichu=@Ghichu where guid_id='" + guid_donhang + "'";
        MY_HASTABLE["Ghichu"] = TextBoxGhichu.Text;
        myUti.ExecuteSql(sqlx, MY_HASTABLE);
        SystemUti.ShowAndGo("Đã trả đồ!", "login.aspx");


    }
}