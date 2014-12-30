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

public partial class donhanglist : CommonPageNhanVien
{

    public DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {



        string sql = @" SELECT        guid_id, ngay, gio, loai, idsp as title, isdichvu, (select portnumber from aport where id=AGioHangTemp.aportid) AS sttmay, soluong, giathanh, acuahangid, anhanvienid, adonhang_guid_id, date_create, guid_giohang, 
                         soluong * giathanh AS thanhtien
FROM            AGioHangTemp ";
        sql += " where anhanvienid=" + MySession.Current.SSUserId + " order by date_create desc";
        dt = myUti.GetDataTable(sql, null);






    }
    public string getSPorDV(object oidspdv, object isdichvu)
    {
        string sqlx ="";
//      sqlx = @"
//SELECT        ADanhMucDV.Title + cast( ADichVu.SoPhut as varchar)+N' Phút'
//FROM            ADichVu INNER JOIN
//                         ADanhMucDV ON ADichVu.ADanhMucDVId = ADanhMucDV.Id";
//        sqlx += " where ADichVu.id=" + oidspdv.ToString();
//        return sqlx;
        try
        {
            string idspdv = oidspdv.ToString();
            string isdv = isdichvu.ToString();
            if (isdv != "1")
            {

                return myUti.GetOneField("Select title from spweb where id=" + idspdv);
            }
            else
            {
                sqlx = @"
SELECT        ADanhMucDV.Title + cast( ADichVu.SoPhut as varchar)+N' Phút'
FROM            ADichVu INNER JOIN
                         ADanhMucDV ON ADichVu.ADanhMucDVId = ADanhMucDV.Id";
                sqlx += " where ADichVu.id=" + idspdv;
                return myUti.GetOneField(sqlx);
            }
        }
        catch
        {
            return sqlx;
        }
        return "";
    }
    public string getMadonhang(object oidspdv)
    {

        string guid_donhang = oidspdv.ToString();
        return myUti.GetOneField("Select madonhang from ADonHang where guid_id='" + guid_donhang + "'");

    }
}