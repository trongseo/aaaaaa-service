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
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Linq;
public partial class AdminModule_TaoTheCao : CommonPageFree
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        
    }




    private static readonly Random random = new Random();
    private static readonly object syncLock = new object();
    public static int RandomNumber(int min, int max)
    {
        lock (syncLock)
        { // synchronize
            return random.Next(min, max);
        }
    }
    protected void btnTaoTheCaoclick(object sender, EventArgs e)
    {
        int soluong  =int.Parse( TextBoxTongso.Text);
        string blocks = TextBoxBlock.Text.Trim();
        string giago = TextBoxGia.Text.Trim();
        string sqllooo = "";
        for (int i = 0; i < soluong; i++)
        {
            string sotaoduoc ="";
            for (int ij = 0; ij < 12; ij++)
            {
                if (ij==0)
                {
                     sotaoduoc += RandomNumber(0, 9).ToString();
                }else
                sotaoduoc += RandomNumber(0, 9).ToString();
               
            }
            sqllooo += " insert into athecao(Block,Gia,SoTheCao) values(" + blocks + "," + giago + ",'" + sotaoduoc + "');";
        }
        myUti.ExecuteSql(sqllooo);
        
    }
    protected void btnExport(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
        var dt = myUti.GetDataTable("select '=\"'+sothecao +'\"' from athecao where block=" + TextBoxBlock.Text);
     

        string[] columnNames = dt.Columns.Cast<DataColumn>().Select(column => column.ColumnName).ToArray();
        sb.AppendLine(string.Join(",", columnNames));

        foreach (DataRow row in dt.Rows)
        {
            string[] fields = row.ItemArray.Select(field => field.ToString()).
                                            ToArray();
            sb.AppendLine(string.Join(",", fields));
        }

        File.WriteAllText(Server.MapPath(".") + "\\1111.xls", sb.ToString());
    }
}