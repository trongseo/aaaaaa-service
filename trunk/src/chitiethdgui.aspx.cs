﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chitiethd : CommonPageNhanVien
{
    public DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        //khách hàng có giỏ hàng (idnhanvien,co gio hang chua hoan thanh(adonhang_guid_id==null la chua hoan thanh)
        string guid_giohang = "";
        if (GetPara("guid_id")=="")
        {
            guid_giohang = MySession.Current.SSguid_id_donhang;
        
        }else{
            guid_giohang=Request["guid_id"];
            }
        



            string sql = @" SELECT        guid_id, ngay, gio, loai, idsp as title, isdichvu, aportid AS sttmay, soluong, giathanh, acuahangid, anhanvienid, adonhang_guid_id, date_create, guid_giohang, 
                         soluong * giathanh AS thanhtien
FROM            AGioHangTemp ";
            sql += " where  adonhang_guid_id='" + guid_giohang + "' order by ngay";
            dt= myUti.GetDataTable(sql,null);
            


         //   data: 'DropDownListLoaiSP=' + loaisp +'&DropDownListSP=' + idsp +'TextBoxNgaySP=' + ngadv ,

          //  Response.Write(guid_giohang);
           // Session.Clear();
            return;
       

        

       
        
    }
    public  string getSPorDV(object oidspdv, object isdichvu)
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
}