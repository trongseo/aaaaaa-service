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

public partial class dieukhienthietbi : CommonPageNhanVien
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

        
        string sql = @" SELECT        guid_id, ngay, gio, loai, idsp as title, isdichvu, aportid AS sttmay, soluong, giathanh, acuahangid, anhanvienid, adonhang_guid_id, date_create, guid_giohang, 
                         soluong * giathanh AS thanhtien
FROM            AGioHangTemp ";
        sql += " where anhanvienid=" + MySession.Current.SSUserId + " order by date_create desc";
        dt = myUti.GetDataTable(sql, null);

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
}