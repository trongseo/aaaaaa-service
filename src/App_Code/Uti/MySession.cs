using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

using System.Data;

/// <summary>
/// Summary description for MySession
/// </summary>
public class MySession
{
    // private constructor
    private MySession()
    {
        numbernext = 0;
    }

    // Gets the current session.
    public static MySession Current
    {
        get
        {
            MySession session =
              (MySession)HttpContext.Current.Session["__MySession__"];
            if (session == null)
            {
                session = new MySession();
                HttpContext.Current.Session["__MySession__"] = session;
            }
            return session;
        }
    }

    // **** add your session properties here, e.g like this:
    public string ssCultureInfo { get; set; }
    public DateTime MyDate { get; set; }
    //Gan quyen cho page con như userupdate,usergroupupdate .Gia tri = 0:Khong co quyen,=1:insert,=2 update
    public int PermissionPartPage { get; set; }
    /// <summary>
    /// 1 =isyear,0 = month
    /// </summary>
    public string isYear { get; set; }
    public int numbernext { get; set; }
    public string Idnumber { get; set; }
    public string UserId { get; set; }
    public string OprIdMap { get; set; }
    public string UserGroupId { get; set; }
    public string UserFullName { get; set; }
    public DataTable DT_AcessRights { get; set; }
    public string ScreenId { get; set; }
    public Hashtable WhereData { get; set; }
    public string WhereCondition { get; set; }
    //public USERS_ONLINEDTO UserLogin { get; set; }
     
}
