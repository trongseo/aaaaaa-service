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

           
           
             string sql = @" SELECT     AGioHangTemp.guid_id, AGioHangTemp.ngay, AGioHangTemp.gio, AGioHangTemp.loai, AGioHangTemp.idsp, AGioHangTemp.isdichvu, AGioHangTemp.sttmay, 
                      AGioHangTemp.soluong, AGioHangTemp.giathanh, AGioHangTemp.acuahangid, AGioHangTemp.anhanvienid, AGioHangTemp.adonhang_guid_id, 
                      AGioHangTemp.date_create, AGioHangTemp.guid_giohang, SPWeb.Title,AGioHangTemp.soluong * AGioHangTemp.giathanh as thanhtien
FROM         AGioHangTemp INNER JOIN
                      SPWeb ON AGioHangTemp.idsp = SPWeb.Id";
             sql += " where AGioHangTemp.guid_giohang='" + guid_giohang + "'";
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
}