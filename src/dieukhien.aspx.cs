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

public partial class dieukhien : CommonPageNhanVien
{

    public DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (IsPostBack)
        {
            return;
        }
      //  CASE WHEN isoff< 1 THEN N'Đang mở' ELSE N'Đang tắt' END AS ColumnName
     string sqlget= @"   SELECT [Id]
                  , 'Port ' + cast([portnumber] as varchar)+' ' +CASE WHEN isoff< 1 THEN N'Đang mở' ELSE N'Đang tắt' END  as sttext
                  ,[portnumber] 
                  ,[MoTa]
                  ,[date_create]
                  ,[acuahangid]
              FROM  [aport]   where isoff=1 and acuahangid=" + MySession.Current.SSCuaHangId;
      var dtports = myUti.GetDataTable(sqlget);
      ListBox1.DataSource = dtports;
      ListBox1.DataTextField = "sttext";
      ListBox1.DataValueField = "portnumber";
      ListBox1.DataBind();
      Session["guid_hisport"] = GetPara("guid_hisport");
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
        Session["guid_dichvu"] = getguid;
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

        if (ListBox1.SelectedValue != "")
        {
            string sqlxx = "update aport set isoff =( CASE WHEN isoff< 1 THEN 1 ELSE 0 end),isget=1 where id=" + ListBox1.SelectedValue + " and acuahangid=" + MySession.Current.SSCuaHangId;
           // Response.Write(sqlxx);
       //    myUti.ExecuteSql(sqlxx);
           string sqlx = "update AHisPort set date_on=getdate(),port_number=" + ListBox1.SelectedValue + ", isget=1,isfinish=0   where guid_id='" + Session["guid_hisport"].ToString() + "'";
         //  myUti.ExecuteSql(sqlx);

           string sqlagiohangtemp = "update agiohangtemp set port_dieukhien=" + ListBox1.SelectedValue + " where guid_id='" + Session["guid_dichvu"].ToString() + "'";
         //  myUti.ExecuteSql(sqlx);
           string[] arrc = { sqlxx, sqlx, sqlagiohangtemp };
           Session["guid_hisport"] = null;
           Session["guid_dichvu"] = null;
           if (myUti.InsertTrans(arrc, "sqltrans") == "0")
           {
               SystemUti.ShowAndGo("Thất bại!!!", "dieukhienthietbi.aspx");
               return;
           }

         
            Response.Redirect("dieukhienthietbi.aspx?mess=Đã điều khiển chuyển trạng thái!");
           
        }
        else
        {
            SystemUti.Show("Hãy chọn port để đổi trạng thái!");
        }
    }
}