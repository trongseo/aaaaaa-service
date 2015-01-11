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

public partial class AdminModule_GroupList : CommonPageFree
{

    public DataTable dt = new DataTable();
    public string mytype = "1";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        if (Request["type"] != null)
        {
            mytype = Request["type"];
        }
        else
        {
            Response.Redirect("GroupList.aspx?type=1&" + Request.QueryString.ToString());
        }


        if (Request["add"] != null)
        {

            myUti.InsertDataReturnID("insert into CateType(title,type,acuahangid) values('nhom moi'," + mytype + "," + MySession.Current.SSCuaHangId + ") ", null);
            Response.Redirect("GroupList.aspx");
            return;
        }
      

        //  Paginater1.PageSize = 6;
        int pz = 10;
        int pi = 1;
        if (Request["page"] != null)
        {
            pi = int.Parse(Request["page"]);
        }
        string where = "";
        int recFrom = 1;
        int recTo = 1;
        if (pi == 1)
        {
            recFrom = 1;
            recTo = pz;
        }
        else
        {
            recFrom = pi * pz - pz + 1;
            recTo = recFrom + pz - 1;
        }
        // data: "name="+name+"&group_id="+group_id,
        Hashtable hs = new Hashtable();

        string where_ = "where 1=1 and   acuahangid=" + MySession.Current.SSCuaHangId;
        if (Request["user_name"] != null)
            if (Request["user_name"] != "")
            {
                hs["user_name"] = "%" + Request["user_name"] + "%";
                where_ = " and [user_name] like @user_name";
            }

        string tblname = "CateType";
        string order_by = "Id";
        string sqlx = " WITH Ordered1 AS " +
        " (SELECT *, ROW_NUMBER() OVER (order by " + order_by + ") as RowNumber " +
        " FROM " + tblname + "  " + where_ + ")" +
        " SELECT * " +
        " FROM Ordered1 " +
        " WHERE RowNumber between " + recFrom + " and " + recTo;
        string sqlcount = " select count(Id) from " + tblname + " " + where_ + " ";
        string reco = myUti.GetDataTable(sqlcount, hs).Rows[0][0].ToString();

        dt = myUti.GetDataTable(sqlx, hs);
        int totalPage = int.Parse(reco) / pz;

        //add the last page, ugly
        if (int.Parse(reco) % pz != 0) totalPage++;

        PagingNum(totalPage, pi);
    }
    public string quesryxx_ = "";
    public string link = "";
    public string end_page = "";
    string pagemy = "GroupList.aspx";
    private void PagingNum(int totalpage, int currentpage)
    {


        end_page = totalpage.ToString();
        string first = "<td align='center' valign='middle'><img src='images/btnFirst.gif' width='21' height='19' /></td>";
        //string first = "<td align='center' valign='middle'>First</td>";
        string prev = "<td align='center' valign='middle'><img src='images/btnPrev.gif' width='21' height='19' /></td>";
        //string prev = "<td align='center' valign='middle'><<Pre</td>";
        string next = "  <td align='center' valign='middle'><img src='images/btnNext.gif' width='21' height='19' /></td>";
        // string next = "  <td align='center' valign='middle'>NEXT</td>";
        string end = " <td align='center' valign='middle'><img src='images/btnEnd.gif' width='21' height='19' /></td>";
        //string end = " <td align='center' valign='middle'>END</td>";

        string inpage = "<td align='center' valign='middle' nowrap='nowrap'>";

        if (totalpage == 1) return;
        if (totalpage >= 2)
        {
            first = "<td align='center' valign='middle'><img src='images/btnFirst.gif' width='21' onclick=\"window.location.href='" + pagemy + "?page=" + (1).ToString() + "'\"  height='19' /></td>";
            end = "<td align='center' valign='middle'><img src='images/btnEnd.gif' width='21' onclick=\"window.location.href='" + pagemy + "?page=" + (totalpage).ToString() + "'\"  height='19' /></td>";
            //totalpage = totalpage - 1;
            link = "";
            for (int i = 1; i <= totalpage; i++)
            {
                if (i != currentpage)
                {
                    link = link + "<a href='" + pagemy + "?page=" + i.ToString() + "'  class='URL' >" + i.ToString() + "</a>&nbsp;";
                }
                else
                    link = link + "<a href='javascript:void(0)' class='URL' >" + i.ToString() + "</a>&nbsp;";

            }
            inpage += link + "</td>";
            if (currentpage != totalpage)//next 
            {
                // link = link + " <span class='pagenum'><a  onclick='javascript:CallLoad(\"" + (currentpage + 1).ToString() + "\") ;return false;' href='javascript:void(0)'> trang tiếp »</a></span>";
                next = "  <td align='center' valign='middle'><img src='images/btnNext.gif' width='21' height='19' onclick=\"window.location.href='" + pagemy + "?page=" + (currentpage + 1).ToString() + "'\" /></td>";
            }
            if (currentpage != 1)//back
            {
                //link = " <span class='pagenum'><a onclick='javascript:CallLoad(\"" + (currentpage - 1).ToString() + "\") ;return false;' href='javascript:void(0)'>« trang trước </a></span>&nbsp;" + link;
                prev = "<td align='center' valign='middle'><img src='images/btnPrev.gif' width='21' height='19'  onclick=\"window.location.href='" + pagemy + "?page=" + (currentpage - 1).ToString() + "'\"  /></td>";
            }
        }
        quesryxx_ = first + prev + inpage + next + end;

    }

    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        string[] allk = Request.Form.AllKeys;
        string delete_id = "";
        for (int i = 0; i < allk.Length; i++)
        {
            if (allk[i].ToString().IndexOf("checkbox_") > -1)
            {
                delete_id += allk[i].Split("_".ToCharArray())[1] + ",";
            }

        }
        delete_id += "0";
        myUti.ExecuteSQL("Delete CateType where Id in(" + delete_id + ")");
        Response.Redirect("GroupList.aspx");
    }
    protected void btn_Add_Click(object sender, EventArgs e)
    {

    }
    string resizeIt(string pathxx)
    {
        ResizeSettings resizeCropSettings = new ResizeSettings("width=100&height=100&format=jpg&crop=auto");
        string uploadFolder = Server.MapPath("..") + "\\ItemImage\\";
        //Generate a filename (GUIDs are safest).
        string fileName = pathxx.Replace(".jpg", "_crop2_2");

        //Let the image builder add the correct extension based on the output file type (which may differ).
        fileName = ImageBuilder.Current.Build(pathxx, fileName, resizeCropSettings, false, true);
        return fileName;
    }
    void uploadFile()
    {
        string[] allk = Request.Files.AllKeys;
        for (int i = 0; i < allk.Length; i++)
        {
            if (allk[i].ToString().IndexOf("file_") > -1)
            {
                HttpPostedFile pf = Request.Files[i];
                string fname = checkFile(pf);
                string myid = allk[i].Split("_".ToCharArray())[1];
                if (fname != "")
                {
                    fname = "group_" + myid + "_" + fname;
                    pf.SaveAs(Server.MapPath("..") + "\\ItemImage\\" + fname);
                    resizeIt(Server.MapPath("..") + "\\ItemImage\\" + fname);
                    System.Collections.Hashtable hs = new Hashtable();
                    hs["image1"] = fname.Replace(".jpg", "_crop2_2.jpg"); ;
                    myUti.UpdateData(" Update CateType set image1=@image1 where Id =" + myid, hs);
                }



            }
        }
    }
    string checkFile(HttpPostedFile pf)
    {
        //pf.FileName
        if (pf.ContentType.IndexOf("image") == -1)
        {
            return "";
        }
        return pf.FileName;
        //pf.InputStream.Length
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        uploadFile();


        string[] allk = Request.Form.AllKeys;
        string myid = "";

        for (int i = 0; i < allk.Length; i++)
        {
            if (allk[i].ToString().IndexOf("title_") > -1)
            {
                myid = allk[i].Split("_".ToCharArray())[1];
                string vmy = Request.Form["title_" + myid].ToString();
                System.Collections.Hashtable hs = new Hashtable();
                hs["title"] = vmy;
                myUti.UpdateData(" Update CateType set title=@title where Id =" + myid, hs);



            }


            if (allk[i].ToString().IndexOf("stt_") > -1)
            {
                myid = allk[i].Split("_".ToCharArray())[1];
                string vmy = Request.Form["stt_" + myid].ToString();

                try
                {
                    int sl = int.Parse(vmy);
                    if (sl <= 0)
                    {
                        SystemUti.Show("Số thứ tự >0", "location.href='GroupList.aspx'");
                        return;
                    }
                    vmy = sl.ToString();
                    myUti.UpdateData(" Update CateType set stt=" + vmy + " where Id =" + myid, null);

                }
                catch
                {
                    SystemUti.Show("Số thứ tự >0", "location.href='GroupList.aspx' "); ;
                    return;
                }
            }

        }
        Response.Redirect("GroupList.aspx");

    }
}