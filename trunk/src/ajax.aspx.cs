using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ajax : CommonPageNhanVien
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //from=deletesp&r=' + Math.random(),
        //                                                                    type: 'POST',
        //                                                                    cache: false,
        //                                                                    data: 'guididsp=' + guididsp ,
          if (Request["from"] == "deletesp")
        {
            string guididsp = GetPara("guididsp");
            string sqlcheck = "delete   agiohangtemp where  guid_giohang='" + MySession.Current.SSGuidGioHang + "' and guid_id='" + guididsp+"'";
            myUti.ExecuteSql(sqlcheck);
            Response.Clear();
            Response.Write("1");
            Response.End();
            return;
        }
         //url: 'ajax.aspx?from=savedichvu& 'loaidvid=' + loaidvid + '&idthoigian=' + idthoigian + '&ngaydv=' + ngaydv + '&portid=' + portid
          if (Request["from"] == "savedichvu")
          {
              string guid_giohang = MySession.Current.SSGuidGioHang;

              //kiem tra xem gio hang da co san pham nay chua
              string idthoigian = GetPara("idthoigian");
              string sqlcheck = "select guid_id from agiohangtemp where isdichvu=1 and guid_giohang='" + MySession.Current.SSGuidGioHang + "' and idsp=" + idthoigian;
              string isexist = myUti.CheckExist(sqlcheck);
              string guid = isexist;
              if (isexist != null)
              {
                  //update sp len
              }
              else
              {
                  guid = myUti.GetGuid_Id();
                  //insert vao
                  string sqli = " insert into AGioHangTemp(soluong,guid_id,anhanvienid,isdichvu,guid_giohang) values(1,'" + guid + "'," + MySession.Current.SSUserId + ",1,'" + guid_giohang + "') ";
                  myUti.ExecuteSql(sqli, null);
              }
              string loaisp = GetPara("loaidvid");
              string ngadv = SystemUti.ConverDDMMYYYYtoYYYYMMDD(GetPara("ngaydv"));
              string portid = GetPara("portid");
              string giathanh = myUti.GetOneField("Select PriceSale from ADichVu where id=" + idthoigian);

              System.Collections.Hashtable hs = new Hashtable();

              string sql = "UPDATE [AGioHangTemp] " +
              " SET [ngay] ='" + ngadv + "'" +
               " ,[idsp] = " + idthoigian +
                " ,aportid = " + portid +
                  " ,[giathanh] = " + giathanh +
              " WHERE guid_id='" + guid + "'";
              myUti.UpdateData(sql, hs);



              //   data: 'DropDownListLoaiSP=' + loaisp +'&DropDownListSP=' + idsp +'TextBoxNgaySP=' + ngadv ,


              Response.Clear();
              Response.Write("1");
              Response.End();
              return;
          }
        
        //kiem tra tien cua nhanvien con du de mua hang ko
              if (Request["from"] == "kiemtratien")
              {
                  string resultr = "1";
                  if (ajax.kiemTraTien(MySession.Current.SSUserId) < 0)
                  {
                      resultr = "0";
                  }
                     Response.Clear();
                     Response.Write(resultr);
                    Response.End();
                    return;

              }
        if (Request["from"] == "savesp")
        {
            string guid_giohang = MySession.Current.SSGuidGioHang;

            //kiem tra xem gio hang da co san pham nay chua
            string idsp = GetPara("DropDownListSP");
             string sqlcheck = "select guid_id from agiohangtemp where isdichvu=0 and guid_giohang='" + MySession.Current.SSGuidGioHang + "' and idsp=" + idsp;
             string isexist = myUti.CheckExist(sqlcheck);
             string guid = isexist;
             if (isexist!=null)
             {
                 //update sp len
             }
             else
             {
                 guid = myUti.GetGuid_Id();
                 //insert vao
                 string sqli = " insert into AGioHangTemp(soluong,guid_id,anhanvienid,isdichvu,guid_giohang) values(0,'" + guid + "'," + MySession.Current.SSUserId + ",0,'" + guid_giohang + "') ";
                 myUti.ExecuteSql(sqli, null);
             }
             string loaisp = GetPara("DropDownListLoaiSP");
             string ngadv =  SystemUti.ConverDDMMYYYYtoYYYYMMDD( GetPara("TextBoxNgaySP"));
             string soluong = GetPara("soluong");
             string giathanh = myUti.GetOneField("Select PriceSale from spweb where id="+idsp);

             System.Collections.Hashtable hs = new Hashtable();
           
             string sql = "UPDATE [AGioHangTemp] " +
             " SET [ngay] ='" + ngadv + "'" +
              " ,[idsp] = " + idsp +
               " ,soluong = soluong+" + soluong +
                 " ,[giathanh] = " + giathanh +
             " WHERE guid_id='" + guid+"'";
             myUti.UpdateData(sql, hs);
            


         //   data: 'DropDownListLoaiSP=' + loaisp +'&DropDownListSP=' + idsp +'TextBoxNgaySP=' + ngadv ,
           

            Response.Clear();
            Response.Write("1");
            Response.End();
            return;
        }
        
            if (Request["from"] == "listdv")
        {
            string loaidvid = GetPara("loaidvid");
            string results = "";
            string sqlex = "Select  Id, cast(SoPhut as varchar) + ' Giá:'+  REPLACE(CONVERT(varchar(20), (CAST(([PriceSale]) AS money)), 1), '.00', '') as Title from ADichVu where ADanhMucDVId=" + loaidvid + " and Acuahangid=" + MySession.Current.SSCuaHangId;
            if (loaidvid == "0")
            {
                sqlex = "Select  Id,cast(SoPhut as varchar) + ' Giá:'+  REPLACE(CONVERT(varchar(20), (CAST(([PriceSale]) AS money)), 1), '.00', '') as Title from ADichVu where  Acuahangid=" + MySession.Current.SSCuaHangId;
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

        if (Request["from"] == "listsp")
        {
            string results = "";
            string sqlex = "Select  Id,Title + ' Giá:'+  REPLACE(CONVERT(varchar(20), (CAST(([PriceSale]) AS money)), 1), '.00', '') as Title from spweb where cateid=" + Request["DropDownListLoaiSP"] + " and Acuahangid=" + MySession.Current.SSCuaHangId;
            if (Request["DropDownListLoaiSP"]=="0")
            {
                sqlex = "Select  Id,Title + ' Giá:'+  REPLACE(CONVERT(varchar(20), (CAST(([PriceSale]) AS money)), 1), '.00', '') as Title from spweb where  Acuahangid=" + MySession.Current.SSCuaHangId;
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
        //disable button cho dich vu
        if (Request["from"] == "checkdisable")
        {
            string results = "";
            string sqlex = "SELECT   guid_id FROM   AGioHangTemp  where isdichvu=1 and guid_giohang='" + MySession.Current.SSGuidGioHang+ "'  ";

            string val = myUti.CheckExist(sqlex);
          
            results = "0";
           if (val!=null)
	        {
                results = "1";
	        }
           Response.Clear();
            Response.Write(results);
            Response.End();
            return;
        }
    }

    public static float kiemTraTien(string userid)
    {
        var myUti1 = new MyUtilities();
        string guidgiohang = MySession.Current.SSGuidGioHang;
        string sql1 = " select sum(soluong*giathanh) from agiohangtemp where    guid_giohang='" + guidgiohang + "'";
        string sumvale = myUti1.GetOneField(sql1);
        string tientk = myUti1.GetOneField("Select  REPLACE(CONVERT(varchar(20), (CAST(([SoTien]) AS money)), 1), '.00', '')  from ATaiKhoan where athanhvienid=" + userid);
        float tiencon = float.Parse(tientk) - float.Parse(sumvale);
        return tiencon;

    }
}