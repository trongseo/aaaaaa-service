using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;


public class MyUtilities
{
    private const int cons_NullValue = -1;

    public string myConnectString = "";



    public DBAssist dbass;
    public MyUtilities(string connectString)
    {
        myConnectString = connectString;
        dbass = new DBAssist(connectString);
    }
    public MyUtilities()
    {
        // EntityConnection econn = new EntityConnection("name=RTC_TESTEntities");

        myConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["DBCONNECTION"].ToString();
        dbass = new DBAssist(myConnectString);
    }
    public string vie2engPath(object obst)
    {
       return vie2eng(obst).Replace(" ", "-");
    }
    public  string vie2eng(object obst )
    {
        string st = obst.ToString();
        string vietChar = "á|à|ả|ã|ạ|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ|é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ|ó|ò|ỏ|õ|ọ|ơ|ớ|ờ|ở|ỡ|ợ|ô|ố|ồ|ổ|ỗ|ộ|ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự|í|ì|ỉ|ĩ|ị|ý|ỳ|ỷ|ỹ|ỵ|đ|Á|À|Ả|Ã|Ạ|Ă|Ắ|Ằ|Ẳ|Ẵ|Ặ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ|É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ|Ó|Ò|Ỏ|Õ|Ọ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự|Í|Ì|Ỉ|Ĩ|Ị|Ý|Ỳ|Ỷ|Ỹ|Ỵ|Đ";
        string engChar = "a|a|a|a|a|a|a|a|a|a|a|a|a|a|a|a|a|e|e|e|e|e|e|e|e|e|e|e|o|o|o|o|o|o|o|o|o|o|o|o|o|o|o|o|o|u|u|u|u|u|u|u|u|u|u|u|i|i|i|i|i|y|y|y|y|y|d|A|A|A|A|A|A|A|A|A|A|A|A|A|A|A|A|A|E|E|E|E|E|E|E|E|E|E|E|O|O|O|O|O|O|O|O|O|O|O|O|O|O|O|O|O|U|U|U|U|U|U|U|U|U|U|U|I|I|I|I|I|Y|Y|Y|Y|Y|D";
        string[] myvietChar = vietChar.Split("|".ToCharArray());
        string[] myengChar = engChar.Split("|".ToCharArray());
        for (int i = 0; i < st.Length; i++)
        {
            if (vietChar.IndexOf(st[i]) > -1)
            {
                //, 
                st = st.Replace(vietChar[vietChar.IndexOf(st[i])].ToString(), engChar[vietChar.IndexOf(st[i])].ToString());
            }
        }
        return st;

    }
    public SqlParameter[] GetParametersFrom(int id, string value, string textSql)
    {
        SqlParameterCollection parameters = new SqlCommand().Parameters;

        parameters.Add("@Id", SqlDbType.Int).Value = id;
        parameters.Add("@" + textSql, SqlDbType.NVarChar).Value = value;
        SqlParameter[] paramList = new SqlParameter[parameters.Count];
        parameters.CopyTo(paramList, 0);
        parameters.Clear();

        return paramList;
    }
    public DataRow GetDataRow(string textSQL)
    {
        return SelectData(textSQL, null).Rows[0];
    }
    public bool CheckExist(string fieldName,string tableName,string valueCheck)
    {
       string  textSQL ="Select 1 from "+tableName +" where "+fieldName +"=@"+fieldName;
        Hashtable hsv = new Hashtable();
        hsv[fieldName] = valueCheck;
        DataTable dt = SelectData(textSQL, hsv);
        if (dt.Rows.Count==1)
	    {
		     return true;
	    }
        return false;
    }
    /// <summary>
    /// Neu khong ton tai return null
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public string CheckExist(string sql)
    {
        DataTable dt = SelectData(sql, null);
        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0][0].ToString();
        }
        return null;
    }
    public bool CheckExistKhachId(string fieldName, string tableName, string valueCheck,string idvalue)
    {
        string textSQL = "Select 1 from " + tableName + " where id !=" + idvalue + " and " + fieldName + "=@" + fieldName;
        Hashtable hsv = new Hashtable();
        hsv[fieldName] = valueCheck;
        DataTable dt = SelectData(textSQL, hsv);
        if (dt.Rows.Count == 1)
        {
            return true;
        }
        return false;
    }
    public string InsertData(string textSQL)
    {
        return InsertDataReturnID(textSQL, null);
    }

    public void DeleteData(string textSQL, Hashtable haspara)
    {
        ExecuteSQL(textSQL, haspara);
    }
    public void DeleteData(string textSQL)
    {
        ExecuteSQL(textSQL, null);
    }
    public void ExecuteSql(string textSQL, Hashtable haspara)
    {
        ExecuteSQL(textSQL, haspara);
    }
    public void ExecuteSql(string textSQL)
    {
        ExecuteSQL(textSQL, null);
    }
    public string InsertData(string textSQL, Hashtable haspara)
    {
        return InsertDataReturnID(textSQL, haspara);
    }
    public DataTable SelectData(string textSQL, Hashtable haspara)
    {

        SqlConnection cn = dbass.Connection;
       ////// cn.Open();

        //Business.SqlHelper.ExecuteNonQuery(cn, CommandType.Text, textSQL, GetParametersText(haspara));
        if (haspara == null)
        {
            return Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL).Tables[0];
        }
        else
        {
            return Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL, GetParametersText(haspara)).Tables[0]; ;
        }

        return null;

    }
    public string GetGuid_Id()
    {
        return SequentialGuidGenerator.NewSequentialGuid(SequentialGuidType.SequentialAsString).ToString();
    }
    public DataTable GetDataTable(string textSQL, Hashtable haspara)
    { 
        return SelectData( textSQL,  haspara);
    }
    public DataTable GetDataTable(string textSQL)
    {
        return SelectData(textSQL, null);
    }
    public string GetOneField(string textSQL)
    {
        return SelectData(textSQL, null).Rows[0][0].ToString();
    }
    public DataTable GeDataTable(string textSQL, Hashtable haspara)
    { 
        return SelectData( textSQL,  haspara);
    }
    public DataTable GeDataTable(string textSQL)
    {
        return SelectData(textSQL, null);
    }
    public DataTable SelectDataFromStored(string storedName, Hashtable haspara)
    {

        var cn = dbass.Connection;
        if (haspara == null)
        {
            return Business.SqlHelper.ExecuteDataset(cn, CommandType.StoredProcedure, storedName).Tables[0];
        }
        else
        {
            return Business.SqlHelper.ExecuteDataset(cn, CommandType.StoredProcedure, storedName, GetParametersText(haspara)).Tables[0]; ;
        }
    }

    public DataSet SelectDataDataSet(string textSQL, Hashtable haspara)
    {

        SqlConnection cn = dbass.Connection;
        ////cn.Open();

        //Business.SqlHelper.ExecuteNonQuery(cn, CommandType.Text, textSQL, GetParametersText(haspara));
        if (haspara == null)
        {
            return Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL);
        }
        else
        {
            return Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL, GetParametersText(haspara));
        }

        return null;

    }

    public void ExecuteSQL(string textSQL)
    { 
         ExecuteSQL( textSQL, null);
    }
    public void ExecuteSQL(string textSQL, Hashtable haspara)
    {

        SqlConnection cn = dbass.Connection;
       //// cn.Open();

        //Business.SqlHelper.ExecuteNonQuery(cn, CommandType.Text, textSQL, GetParametersText(haspara));
        if (haspara == null)
        {
            //Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL);
            Business.SqlHelper.ExecuteNonQuery(cn, CommandType.Text, textSQL);
        }
        else
        {
            //Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL, GetParametersText(haspara)) ;
            Business.SqlHelper.ExecuteNonQuery(cn, CommandType.Text, textSQL, GetParametersText(haspara));
        }



    }
    /// <summary>
    /// Return one value
    /// </summary>
    /// <param name="textSQL"></param>
    /// <param name="haspara"></param>
    /// <returns></returns>
    public string ExecuteSQLOneValue(string textSQL, Hashtable haspara)
    {
        try
        {
            SqlConnection cn = new SqlConnection(myConnectString);
           /// cn.Open();
            textSQL += " ";
            DataTable dt = new DataTable();
            if (haspara == null)
            {

                dt = Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL).Tables[0];
            }
            else
            {
                dt = Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL, GetParametersText(haspara)).Tables[0]; ;
            }

            cn.Close();

            cn.Dispose();

            return dt.Rows[0][0].ToString();
        }
        catch
        {
            return "";
        }

        return "";

    }
    public string StartTrans = "";
    public string CommitTrans = "";
    public string RollBackTrans = "";
    /// <summary>
    ///haspara=null   string sql = " insert into commentHotNews(NewsHotId,MemberId,Comment) values("+ MyUtilities.GetId() +","+SessionUtilities.SSUserId+",@Comment)";
    /// string commnet_id=  MyUtilities.InsertData(sql, cm);insert into ()... +@@identity
    /// </summary>
    /// <param name="textSQL"></param>
    /// <param name="haspara"></param>

    /// <returns>Return id inserted</returns>
    public string InsertDataReturnID(string textSQL, Hashtable haspara)
    {
        SqlConnection cn = new SqlConnection(myConnectString);
      ///  cn.Open();
        textSQL += ";select SCOPE_IDENTITY() ";
        DataTable dt = new DataTable();
        if (haspara == null)
        {

            dt = Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL).Tables[0];
        }
        else
        {
            dt = Business.SqlHelper.ExecuteDataset(cn, CommandType.Text, textSQL, GetParametersText(haspara)).Tables[0]; ;
        }

        cn.Close();

        cn.Dispose();

        return dt.Rows[0][0].ToString();
    }

    /// <summary>
    /// Thu tu cau sql va para phai giong nhau    
    /// </summary>
    /// <param name="arSQL">chua danh sach cac cau lenh sql can thuc thi voi paramater tuong ung trong arPara</param>
    /// <param name="arPara">Chua ds cac parameter tuong ung</param>
    /// <param name="transName">ten cua transaction</param>
    /// <returns></returns>
    public string InsertTrans(ArrayList arSQL, ArrayList arPara, string transName)
    {
        using (SqlConnection connection = new SqlConnection(myConnectString))
        {
            connection.Open();

            SqlCommand command = connection.CreateCommand();
            SqlTransaction transaction;

            // Start a local transaction.
            transaction = connection.BeginTransaction(transName);

            // Must assign both transaction object and connection 
            // to Command object for a pending local transaction
            command.Connection = connection;
            command.Transaction = transaction;

            try
            {
                for (int i = 0; i < arSQL.Count; i++)
                {
                    string sqlEx = arSQL[i].ToString();
                    Hashtable hsPara = (Hashtable)arPara[i];
                    this.AddParameters(command, GetParametersText(hsPara));
                    command.CommandText = sqlEx;
                    command.ExecuteNonQuery();
                    command.Parameters.Clear();

                }

                transaction.Commit();

            }
            catch (Exception ex)
            {
                Console.WriteLine("Commit Exception Type: {0}", ex.GetType());
                Console.WriteLine("  Message: {0}", ex.Message);

                // Attempt to roll back the transaction. 
                try
                {
                    transaction.Rollback();
                }
                catch
                {
                    return "0";
                }

                return "0";
            }
        }

        return "1";

    }
    private void AddParameters(SqlCommand command, SqlParameter[] commandParameters)
    {

        if (commandParameters != null)
        {
            foreach (SqlParameter p in commandParameters)
            {
                if (p != null)
                {
                    // Check for derived output value with no value assigned
                    if ((p.Direction == ParameterDirection.InputOutput ||
                        p.Direction == ParameterDirection.Input) &&
                        (p.Value == null))
                    {
                        p.Value = DBNull.Value;
                    }
                    command.Parameters.Add(p);
                }
            }
        }

    }

    /// <summary>
    /// if haspara=null thi truyen = null
    /// </summary>
    /// <param name="textSQL"></param>
    /// <param name="haspara"></param>
    public void UpdateData(string textSQL, Hashtable haspara)
    {

        SqlConnection cn = dbass.Connection;
        cn.Open();
        if (haspara == null)
        {
            Business.SqlHelper.ExecuteNonQuery(cn, CommandType.Text, textSQL);
        }
        else
        {
            Business.SqlHelper.ExecuteNonQuery(cn, CommandType.Text, textSQL, GetParametersText(haspara));
        }
        cn.Close();
        cn.Dispose();

    }
    public SqlParameter[] GetParametersText(Hashtable haspara)
    {
        SqlParameter[] paramList = new SqlParameter[haspara.Count];
        int i = 0;
        SqlParameterCollection parameters = new SqlCommand().Parameters;
        foreach (DictionaryEntry item in haspara)
        {

            parameters.Add("@" + item.Key, SqlDbType.NVarChar).Value = item.Value.ToString().Trim();

            i++;
            // parameters.Clear();
        }

        parameters.CopyTo(paramList, 0);
        parameters.Clear();
        return paramList;
    }




    public SqlParameter[] GetParametersFromBool(int id, bool value, string textSql)
    {
        SqlParameterCollection parameters = new SqlCommand().Parameters;

        parameters.Add("@Id", SqlDbType.Int).Value = id;
        parameters.Add("@" + textSql, SqlDbType.Bit).Value = value;
        SqlParameter[] paramList = new SqlParameter[parameters.Count];
        parameters.CopyTo(paramList, 0);
        parameters.Clear();

        return paramList;
    }

    public SqlParameter[] GetParametersFromInt(int id, int value, string textSql)
    {
        SqlParameterCollection parameters = new SqlCommand().Parameters;

        parameters.Add("@Id", SqlDbType.Int).Value = id;
        parameters.Add("@" + textSql, SqlDbType.Int).Value = value;
        SqlParameter[] paramList = new SqlParameter[parameters.Count];
        parameters.CopyTo(paramList, 0);
        parameters.Clear();

        return paramList;
    }

}

