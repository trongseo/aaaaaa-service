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

public partial class AdminModule_NhapKho : CommonPageFree
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        DataTable dtc = myUti.GetDataTable("Select N'Chọn' AS title,0 AS id union  Select title AS title,id AS id from catetype where type=1");
        DropDownList1.DataSource = dtc;
        DropDownList1.DataTextField = "title";
        DropDownList1.DataValueField = "id";
        DropDownList1.DataBind();
        Image1.Visible = false;
        Button1.Visible = false;
        if (Request["Id"] != null)
        {

            string myid = Request["Id"];
            //        ,[Title]
            //,[DateCreate]
            //,[Shortdescription]
            //,[Description]
            //,[ImageNews]
            //,[IsActive]
            //,[IsDelete]
            //,[ViewPriority]
            //,[IsHome]
            //,[CateId]

          
         

           

            string sql = " SELECT * " +
              "  FROM [aphieunhapkho]  where id=" + myid;
            DataRow dr = myUti.GetDataRow(sql);
            TextBox1Note.Text = dr["Note"].ToString();
            TextBox1Quantity.Text = dr["Quantity"].ToString();
            TextBox3Price.Text = dr["PriceBuy"].ToString();

            //combobox 
            DataRow drxx = myUti.GetDataRow("select * from SpWeb where id =" + dr["SpWebId"].ToString());

            DataTable dtcs = myUti.GetDataTable("Select N'Chọn' AS title,0 AS id union Select title AS title,id AS id from SpWeb where CateId=" + drxx["CateId"].ToString());
            DropDownList2TenSP.DataSource = dtcs;
            DropDownList2TenSP.DataTextField = "title";
            DropDownList2TenSP.DataValueField = "id";
            DropDownList2TenSP.DataBind();
            DropDownList1.SelectedValue=drxx["CateId"].ToString();
            DropDownList2TenSP.SelectedValue = dr["SpWebId"].ToString();
         

           // TextBox1.Text = dr["Title"].ToString();
           // TextBox2.Text = dr["Shortdescription"].ToString();
           // DescriptionTextBox.Text = dr["Description"].ToString();
            //DropDownList1.SelectedValue = dr["CateId"].ToString();
           // EnCheckBox1.Checked = dr["En"].ToString() == "1" ? true : false;
          

        }
        //myUti.
    }
    void capnhap()
    {
        if (!Page.IsValid)
        {
            return;
        }
        string sql = " insert into APhieuNhapKho(Note) values('') ";
        string myid = "";
        if (Request["Id"] == null)
        {
            myid = myUti.InsertData(sql, null);
        }
        else
        {
            myid = Request["Id"];
        }
        System.Collections.Hashtable hs = new Hashtable();
        string checkno = EnCheckBox1.Checked == true ? "1" : "0";

        //  hs["Title"] = TextBox1.Text;
        hs["Note"] = TextBox1Note.Text;

        sql = "UPDATE [APhieuNhapKho] " +
        " SET [Note] =@Note" +

         " ,[Quantity] =" + TextBox1Quantity.Text.Trim() +
           " ,[PriceBuy] =" + TextBox3Price.Text.Trim() +
        ",[SPwebId] = " + DropDownList2TenSP.SelectedValue +
        " WHERE id=" + myid;
        myUti.UpdateData(sql, hs);
    }
    protected void SaveButton_Click(object sender, EventArgs e)
    {
        capnhap();
       // UploadMainImageFile(myid, "PhieuNhapKhoList", "ImageNews", FileUpload1);
        Response.Redirect("NhapKhoList.aspx");
    }

    int width_icon = 70;
    int width_med = 120;
    void UploadMainImageFile(string idInserted, string tblname, string imgfied, FileUpload ful1)
    {
        FileUpload fileUpEx = ful1;
        if (fileUpEx.HasFile)
            if (FileUtilities.IsImageFile(fileUpEx.PostedFile.FileName))
            {

                string filepath = fileUpEx.PostedFile.FileName;
                string file_ext = "";
                string filename = "";
                filename = fileUpEx.PostedFile.FileName.Substring(fileUpEx.PostedFile.FileName.LastIndexOf("\\") + 1);
                string strFileType = fileUpEx.PostedFile.ContentType;
                file_ext = filename.Substring(filename.LastIndexOf("."));

                string file = noihinh + idInserted.ToString() + file_ext;

                string fileicon = noihinh + idInserted.ToString() + "_" + idInserted.ToString() + "_ico" + file_ext;

                string path = Server.MapPath("..") + "\\ImageItem";
                path = path + "\\" + file;
                fileUpEx.PostedFile.SaveAs(path);
                myUti.ExecuteSql("Update " + tblname + " set " + imgfied + "='" + file + "' where Id=" + idInserted.ToString());
                string rename = createThumb(70, 53, path, "_1", idInserted, file_ext);
                // myUti.ExecuteSql("Update " + tblname + " set " + imgfied + "='" + file + "' where Id=" + idInserted.ToString());


            }
    }
    string noihinh = "sanphamit_";
    string createThumb(int imageWidth, int imageHeight, string imageUrl, string duoinoitiep, string idInserted, string file_ext)
    {
        System.Drawing.Image fullSizeImg = System.Drawing.Image.FromFile(imageUrl);
        System.Drawing.Image.GetThumbnailImageAbort dummyCallBack = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
        System.Drawing.Image thumbNailImg = fullSizeImg.GetThumbnailImage(imageWidth, imageHeight, dummyCallBack, IntPtr.Zero);

        String MyString = noihinh + idInserted.ToString() + duoinoitiep + file_ext;
        FileUtilities.DeleteFile(Request.PhysicalApplicationPath + "ItemImage\\" + MyString);
        thumbNailImg.Save(Request.PhysicalApplicationPath + "ItemImage\\" + MyString);
        thumbNailImg.Dispose();
        return MyString;
    }
    public bool ThumbnailCallback()
    {
        return false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string myid = Request["Id"];
        string sql = " select ImageNews from SPWeb where Id=" + myid;
        string im = myUti.GetOneField(sql);
        FileUtilities.DeleteFile(Request.PhysicalApplicationPath + "ItemImage\\" + im);
        sql = "UPDATE [SPWeb] " +
       " SET [ImageNews] =''" +
       " WHERE id=" + myid;
        myUti.UpdateData(sql, null);
        Response.Redirect("NewsManage.aspx?Id=" + myid);
        Button1.Visible = false;
    }
    protected void SaveButton0_Click(object sender, EventArgs e)
    {
        capnhap();
        Response.Redirect("NhapKho.aspx");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dtc = myUti.GetDataTable("Select N'Chọn' AS title,0 AS id union Select title AS title,id AS id from SpWeb where CateId=" + DropDownList1.SelectedValue);
        DropDownList2TenSP.DataSource = dtc;
        DropDownList2TenSP.DataTextField = "title";
        DropDownList2TenSP.DataValueField = "id";
        DropDownList2TenSP.DataBind();
    }
}