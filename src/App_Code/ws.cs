using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for ws
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class ws : System.Web.Services.WebService {

    public ws () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
     
    [WebMethod]
    public System.Data.DataSet GiveMeADataSet()
    {
        MyUtilities myi = new MyUtilities();
       DataTable dt =   myi.GetDataTable("Select * from aconst");

       DataSet ds = new DataSet("ds1");
       ds.Tables.Add(dt.Copy());
        return ds;
    }
    
}
