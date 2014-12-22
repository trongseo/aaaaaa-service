using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajaxgrid : CommonPageNhanVien
{
    public DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        //khách hàng có giỏ hàng (idnhanvien,co gio hang chua hoan thanh(adonhang_guid_id==null la chua hoan thanh)
        if (Request["from"] == "giohang")
        {
            string guid_giohang = MySession.Current.SSGuidGioHang;



            string sql = @" SELECT        guid_id, ngay, gio, loai, idsp as title, isdichvu, aportid AS sttmay, soluong, giathanh, acuahangid, anhanvienid, adonhang_guid_id, date_create, guid_giohang, 
                         soluong * giathanh AS thanhtien
FROM            AGioHangTemp ";
             sql += " where guid_giohang='" + guid_giohang + "'";
            dt= myUti.GetDataTable(sql,null);
            


         //   data: 'DropDownListLoaiSP=' + loaisp +'&DropDownListSP=' + idsp +'TextBoxNgaySP=' + ngadv ,

          //  Response.Write(guid_giohang);
           
            return;
        }

        if (Request["from"] == "listsp")
        {
            string results = "";
            string sqlex = "Select  Id,Title + ' Giá:'+ cast( PriceSale  as varchar ) as Title from spweb where cateid=" + Request["DropDownListLoaiSP"] + " and Acuahangid=" + MySession.Current.SSCuaHangId;
            if (Request["DropDownListLoaiSP"]=="0")
            {
                sqlex = "Select Id,Title + ' '+ cast( PriceSale  as varchar ) as Title from spweb where  Acuahangid=" + MySession.Current.SSCuaHangId;
            }
            var dt = myUti.GetDataTable(sqlex);
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            foreach (DataRow dr in dt.Rows)
            {
                var row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();

            results = serializer.Serialize(rows);

            Response.Clear();
            Response.Write(results);
            Response.End();
            return;
        }

       
        
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
SELECT        ADanhMucDV.Title + cast( ADichVu.SoPhut as varchar)+N' Phút'
FROM            ADichVu INNER JOIN
                         ADanhMucDV ON ADichVu.ADanhMucDVId = ADanhMucDV.Id";
            sqlx += " where ADichVu.id=" + idspdv;
            return myUti.GetOneField(sqlx);
        }
    }
}