using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_UCLeft : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;

        ProcessSearch();
    }

    public int RECORDS_COUNT = 0;
    public string PAGGING_SHOW = "";


    void ProcessSearch()
    {

        int currentPage = 1;
        Hashtable hsWhereData = new Hashtable();
        string sqlWHERE = "where 1=1 ";

        //Neu hien tai dang pagging thi lay lai dieu kien search truoc do
        if (Request["page"] != null)
        {
            currentPage = int.Parse(Request["page"]);
            if (MySession.Current.WhereData != null)
                if (MySession.Current.WhereData.Count != 0)
                {

                }
        }
        else
        {
            if (MySession.Current.WhereData != null)
            {
                MySession.Current.WhereData.Clear();
            }
        }

        Pagging pagging = new Pagging(MySession.Current.ScreenId + ".aspx");
        pagging.PageSize = 119;
        pagging.SetFromTo(currentPage);

        if (Request["KeySearch"] != null)
            if (Request["KeySearch"] != "")
            {
                hsWhereData["KeySearch1"] = "%" + Request["KeySearch"] + "%";
                sqlWHERE += " and ( [ShipID] like @KeySearch1";

                hsWhereData["KeySearch"] = "%" + Request["KeySearch"] + "%";
                sqlWHERE += " OR [ShipName] like @KeySearch )";
            }

        MySession.Current.WhereCondition = sqlWHERE;
        MySession.Current.WhereData = hsWhereData;
        var myUti = new MyUtilities();
        string strTableName = " CateType ";
        string order_by = " stt asc ";
        string columnSelect = @"       Id, Title, Type, stt, image1, CreateDate, UpdateDate, parid
 ";

        string strSQL = " WITH OrderedTable AS " +
        " (SELECT " + columnSelect + ", ROW_NUMBER() OVER (order by " + order_by + ") as RowNumber " +
        " FROM " + strTableName + "  " + sqlWHERE + ")" +
        " SELECT * " +
        " FROM OrderedTable " +
        " WHERE RowNumber between " + pagging.StartRecord + " and " + pagging.EndRecordGet;
        string sqlcount = " select count(ID) from " + strTableName + " " + sqlWHERE + " ";
        string reco = myUti.SelectData(sqlcount, hsWhereData).Rows[0][0].ToString();
        RECORDS_COUNT = int.Parse(reco);
        dtCodeList = myUti.SelectData(strSQL, hsWhereData);
        int totalPage = int.Parse(reco) / pagging.PageSize;

        //add the last page
        if (int.Parse(reco) % pagging.PageSize != 0) totalPage++;

        PAGGING_SHOW = pagging.PagingNum(totalPage, currentPage);
    }
    public DataTable dtCodeList;
}