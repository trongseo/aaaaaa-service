using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class CustomerViewDetail : CommonPageFree
{

  public string latint = "";
  public string longint = "";
    /// <summary>
    /// Data show
    /// </summary>
    public DataTable dtCodeList = new DataTable();

    protected void Page_Init(object sender, EventArgs e)
    {
        MySession.Current.ScreenId = "CustomerViewDetail";
    }
    public DataRow item;
    public DataTable dtImages;
    public string loairap = "";
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Ulti.GetParaUrl("ID") != "")
        {
            string sql = @"SELECT      ID, LAT_X, LONG_Y, ADDRESS, USER_ID, POST_DATE, SERVICE_TYPE, SERVICE_ID,TEN_QUAN, MOTA, T_ID, Q_ID, P_ID, HINH_DAIDIEN, CONTACT_NAME, EMAIL, MO_TA_FULL,GUID_ID,
                        DIEN_THOAI, SLOGAN, FLG_DAT_PHONG, USER_UPDATE, USER_CREATED, DATE_UPDATE, ACTIVE
                        FROM         USER_INFO WHERE ID=@ID AND ACTIVE=1 ";
            MY_HASTABLE["ID"] = Ulti.GetParaUrl("ID");
            MY_DATATABLE = myUti.GetDataTable(sql, MY_HASTABLE);
            item = MY_DATATABLE.Rows[0];
            latint = item["LAT_X"].ToString();
            longint = item["LONG_Y"].ToString();
            MY_HASTABLE.Clear();
            sql = @"SELECT   ID,   USER_INFO_ID,IMAGE1,replace(IMAGE1, '.jpg', '_crop2_2.jpg') as HINH_DAIDIEN_NHO,MOTA
                        FROM         USER_INFO_IMAGES WHERE USER_INFO_ID=@ID or USER_INFO_GUID_ID='" + item["GUID_ID"].ToString() + "'  ORDER BY IMAGE1 DESC";
            MY_HASTABLE["ID"] = Ulti.GetParaUrl("ID");
            dtImages = myUti.GetDataTable(sql, MY_HASTABLE);
            loairap = item["SERVICE_TYPE"].ToString();
            if (loairap == SERVICE_TYPE_BIDA)
            {
                loairap = "Bida";
            }
            if (loairap == SERVICE_TYPE_PHIM)
            {
                loairap = "Rạp chiếu phim";
            }
            if (loairap == SERVICE_TYPE_KARA)
            {
                loairap = "Karaoke";
            }
            ((HiddenField)Header1.FindControl("SERVICE_TYPE")).Value = item["SERVICE_TYPE"].ToString();
            //TextBoxADDRESS.Text = drShow["ADDRESS"].ToString();
            //TextBoxDIEN_THOAI.Text = drShow["DIEN_THOAI"].ToString();
            //TextBoxEmail.Text = drShow["EMAIL"].ToString();
            //TextBoxSLOGAN.Text = drShow["SLOGAN"].ToString();
            //TextBoxTEN_QUAN.Text = drShow["TEN_QUAN"].ToString();
            //TextBoxCONTACT_NAME.Text = drShow["CONTACT_NAME"].ToString();
            //CheckBoxFLG_DAT_PHONG.Checked = drShow["FLG_DAT_PHONG"].ToString() == "1" ? true : false;
            //TextBoxMO_TA.Text = drShow["MOTA"].ToString();
            //HiddenFieldID.Value = Ulti.GetParaUrl("ID");
            //if (drShow["HINH_DAIDIEN"].ToString() != "")
            //{
            //    Image1.Visible = true;
            //    Image1.ImageUrl = "Upload/" + drShow["HINH_DAIDIEN"].ToString();
            //}
            //else
            //{
            //    Image1.Visible = false;
            //}
        }

    }

   
    
}