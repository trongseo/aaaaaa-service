using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Pagging
/// </summary>
public class Pagging
{
   
    private string _pageName;
    public int StartRecord = 0;
    public int EndRecordGet = 0;
    public int PageSize = 0;
	public Pagging(string pageName)
	{
        PageSize = Int32.Parse(System.Configuration.ConfigurationManager.AppSettings["PageSize"]);
        _pageName = pageName;
	}
    public void SetFromTo(int currentPage )
    {
        int recFrom = 1;
        int recTo = 1;
        if (currentPage == 1)
        {
            recFrom = 1;
            recTo = PageSize;
        }
        else
        {
            recFrom = currentPage * PageSize - PageSize + 1;
            recTo = recFrom + PageSize - 1;
        }
        StartRecord = recFrom;
        EndRecordGet = recTo;

    }
    public int groupSize = 10;
    public string PagingNumBackup(int totalpage, int currentpage)
    {
        string link = "";
       
        string first = " <a href='' class='page-far-left'></a>";
        string prev = "<a href='' class='page-left'></a>";
        string next = "<a href='' class='page-right'></a>";
        string end = " <a href='' class='page-far-right'></a>";
        string inpage = "";

        if ((totalpage == 0) || (totalpage == 1)) return "";
        if (totalpage >= 2)
        {
            //first = "<td align='center' valign='middle'><img src='images/btnFirst.gif' width='21' onclick=\"window.location.href='" + pagemy + "?page=" + (1).ToString() + "'\"  height='19' /></td>";
            first = "<a href='javascript:void()' onclick=\"window.location.href='" + _pageName + "?page=" + (1).ToString() + "'\"  class='page-far-left'></a>";
            end = "<td align='center' valign='middle'><img src='images/btnEnd.gif' width='21' onclick=\"window.location.href='" + _pageName + "?page=" + (totalpage).ToString() + "'\"  height='19' /></td>";
            end = " <a href='javascript:void()'   onclick=\"window.location.href='" + _pageName + "?page=" + (totalpage).ToString() + "'\"  class='page-far-right'></a>";
            //totalpage = totalpage - 1;
            link = "";
            int i = 1;

            for (; i <= totalpage; i++)
            {
                if (i != currentpage)
                {
                    link = link + "<a class='page-info' href='" + _pageName + "?page=" + i.ToString() + "'  class='URL' >" + i.ToString() + "</a>&nbsp;";
                }
                else
                    link = link + "<div class='page-info' ><strong>" + i.ToString() + "</strong></div>&nbsp;";

            }
            inpage += link + "";
            if (currentpage != totalpage)//next 
            {
                next = "<a href='javascript:void()'  class='page-right'  onclick=\"window.location.href='" + _pageName + "?page=" + (currentpage + 1).ToString() + "'\" ></a>";
            }
            if (currentpage != 1)//back
            {

                prev = "<a href='javascript:void()'  onclick=\"window.location.href='" + _pageName + "?page=" + (currentpage - 1).ToString() + "'\" class='page-left'></a>";

            }
        }

        //PAGGING_SHOW = first + prev + inpage + next + end;
        return prev + inpage + next;
        //quesryxx_ = prev + next;

    }
    public string PagingNum(int totalpage, int currentpage)
    {
        return PagingNumGroup(totalpage, currentpage);

    }
    public string PagingNumFirst1111(int totalpage, int currentpage)
    {
        string link = "";

        string first = " <a href='' class='page-far-left'></a>";
        string prev = "<a href='' class='page-left'></a>";
        string next = "<a href='' class='page-right'></a>";
        string end = " <a href='' class='page-far-right'></a>";
        string inpage = "";

        if ((totalpage == 0) || (totalpage == 1)) return "";
        if (totalpage >= 2)
        {
            //first = "<td align='center' valign='middle'><img src='images/btnFirst.gif' width='21' onclick=\"window.location.href='" + pagemy + "?page=" + (1).ToString() + "'\"  height='19' /></td>";
            first = "<a href='javascript:void()' onclick=\"window.location.href='" + _pageName + "?page=" + (1).ToString() + "'\"  class='page-far-left'></a>";
            end = "<td align='center' valign='middle'><img src='images/btnEnd.gif' width='21' onclick=\"window.location.href='" + _pageName + "?page=" + (totalpage).ToString() + "'\"  height='19' /></td>";
            end = " <a href='javascript:void()'   onclick=\"window.location.href='" + _pageName + "?page=" + (totalpage).ToString() + "'\"  class='page-far-right'></a>";
            //totalpage = totalpage - 1;
            link = "";
            int i = 1;

            for (; i <= totalpage; i++)
            {
                if (i != currentpage)
                {
                    link = link + "<a class='page-info' href='" + _pageName + "?page=" + i.ToString() + "'  class='URL' >" + i.ToString() + "</a>&nbsp;";
                }
                else
                    link = link + "<div class='page-info' ><strong>" + i.ToString() + "</strong></div>&nbsp;";

            }
            inpage += link + "";
            if (currentpage != totalpage)//next 
            {
                next = "<a href='javascript:void()'  class='page-right'  onclick=\"window.location.href='" + _pageName + "?page=" + (currentpage + 1).ToString() + "'\" ></a>";
            }
            if (currentpage != 1)//back
            {

                prev = "<a href='javascript:void()'  onclick=\"window.location.href='" + _pageName + "?page=" + (currentpage - 1).ToString() + "'\" class='page-left'></a>";

            }
        }

        //PAGGING_SHOW = first + prev + inpage + next + end;
        return prev + inpage + next;
        //quesryxx_ = prev + next;

    }
    public string PagingNumFirst(int totalpage, int currentpage)
    {
        string link = "";

        string first = " <a href='' class='page-far-left'></a>";
        //string prev = "<a href='' class='page-left'></a>";
        string prev = "";
       // string next = "<a href='' class='page-right'></a>";
        string next = "";
        string end = " <a href='' class='page-far-right'></a>";
        string inpage = "";

        if ((totalpage == 0) || (totalpage == 1)) return "";
        if (totalpage >= 2)
        {
            //first = "<td align='center' valign='middle'><img src='images/btnFirst.gif' width='21' onclick=\"window.location.href='" + pagemy + "?page=" + (1).ToString() + "'\"  height='19' /></td>";
            first = "<a href='javascript:void()' onclick=\"window.location.href='" + _pageName + "?page=" + (1).ToString() + "'\"  class='page-far-left'></a>";
            end = "<td align='center' valign='middle'><img src='images/btnEnd.gif' width='21' onclick=\"window.location.href='" + _pageName + "?page=" + (totalpage).ToString() + "'\"  height='19' /></td>";
            end = " <a href='javascript:void()'   onclick=\"window.location.href='" + _pageName + "?page=" + (totalpage).ToString() + "'\"  class='page-far-right'></a>";
            //totalpage = totalpage - 1;
            link = "";
            int i = 1;

            for (; i <= totalpage; i++)
            {
                if (i != currentpage)
                {
                    link = link + "<li><span><a class='page-info' href='" + _pageName + "?page=" + i.ToString() + "'  class='URL' >" + i.ToString() + "</a></span></li>&nbsp;";
                }
                else
                    link = link + "<li><strong>" + i.ToString() + "</strong></li>&nbsp;";

            }
            inpage += link + "";
            if (currentpage != totalpage)//next 
            {
                next = "<a href='javascript:void()'  class='page-right'  onclick=\"window.location.href='" + _pageName + "?page=" + (currentpage + 1).ToString() + "'\" >></a>";
            }
            if (currentpage != 1)//back
            {

                prev = "<li><span><a href='javascript:void()'  onclick=\"window.location.href='" + _pageName + "?page=" + (currentpage - 1).ToString() + "'\" class='page-left'><</a></span></li>";

            }
        }

        //PAGGING_SHOW = first + prev + inpage + next + end;
        return prev + inpage + next;
        //quesryxx_ = prev + next;

    }

    public string PagingNumGroup(int totalpage, int currentpage)
    {
        if ((totalpage < groupSize) || (currentpage < groupSize - 1))
        {
            return PagingNumFirst(totalpage, currentpage);
           
        }
        string link = "";
        
        string first = " <a href='' class='page-far-left'></a>";
        string prev = "<a href='' class='page-left'></a>";
        string next = "<a href='' class='page-right'></a>";
        string end = " <a href='' class='page-far-right'></a>";
        string inpage = "";

        if ((totalpage == 0) || (totalpage == 1)) return "";
        if (totalpage >= 2)
        {
            //first = "<td align='center' valign='middle'><img src='images/btnFirst.gif' width='21' onclick=\"window.location.href='" + pagemy + "?page=" + (1).ToString() + "'\"  height='19' /></td>";
            first = "<a href='javascript:void()' onclick=\"window.location.href='" + _pageName + "?page=" + (1).ToString() + "'\"  class='page-far-left'></a>";
            end = "<td align='center' valign='middle'><img src='images/btnEnd.gif' width='21' onclick=\"window.location.href='" + _pageName + "?page=" + (totalpage).ToString() + "'\"  height='19' /></td>";
            end = " <a href='javascript:void()'   onclick=\"window.location.href='" + _pageName + "?page=" + (totalpage).ToString() + "'\"  class='page-far-right'></a>";
            //totalpage = totalpage - 1;
            link = "";
            int i = 1;
            int maxPageNumShow = currentpage + groupSize;
            if (maxPageNumShow > totalpage)
                maxPageNumShow = totalpage;
            i = maxPageNumShow - groupSize;
            for (; i <= maxPageNumShow; i++)
            {
                if (i != currentpage)
                {
                    link = link + "<a class='page-info' href='" + _pageName + "?page=" + i.ToString() + "'  class='URL' >" + i.ToString() + "</a>&nbsp;";
                }
                else
                    link = link + "<div class='page-info' ><strong>" + i.ToString() + "</strong></div>&nbsp;";

            }
            inpage += link + "";
            if (currentpage != totalpage)//next 
            {
                next = "<a href='javascript:void()'  class='page-right'  onclick=\"window.location.href='" + _pageName + "?page=" + (currentpage + 1).ToString() + "'\" ></a>";
            }
            if (currentpage != 1)//back
            {

                prev = "<a href='javascript:void()'  onclick=\"window.location.href='" + _pageName + "?page=" + (currentpage - 1).ToString() + "'\" class='page-left'></a>";

            }
        }

        //PAGGING_SHOW = first + prev + inpage + next + end;
        return prev + inpage + next;
        //quesryxx_ = prev + next;

    }
}