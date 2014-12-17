using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using MySql.Data.MySqlClient;


public class MySQLUtilities
{
    private const int cons_NullValue = -1;

    public string myConnectString = "";



    public DBAssist dbass;
    public MySQLUtilities(string connectString)
    {
        myConnectString = connectString;
        dbass = new DBAssist(connectString);
    }
    public MySQLUtilities()
    {
        // EntityConnection econn = new EntityConnection("name=RTC_TESTEntities");

        myConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["MySQLDBCONNECTION"].ToString();
        
    }
    public DataTable GetDataTable(  string query)
    {
        DataSet dataset = new DataSet();
        MySqlConnection conn = new MySqlConnection(myConnectString);
        conn.Open();

        MySqlDataAdapter adapter = new MySqlDataAdapter();
        adapter.SelectCommand = new MySqlCommand(query, conn);
        
        adapter.Fill(dataset);
        conn.Close();
        return dataset.Tables[0];
    }
     public DataTable GetDataTable(  string query,Hashtable hsComm)
    {
        DataSet dataset = new DataSet();
        MySqlConnection conn = new MySqlConnection(myConnectString);
        conn.Open();

        MySqlDataAdapter adapter = new MySqlDataAdapter();
        adapter.SelectCommand = GetCommand(query, hsComm, conn);
        
        adapter.Fill(dataset);
        conn.Close();
        return dataset.Tables[0];
    }
     public void ExecuteSQL(string query, Hashtable hsComm)
     {
         DataSet dataset = new DataSet();
         MySqlConnection conn = new MySqlConnection(myConnectString);
         conn.Open();
         
         MySqlDataAdapter adapter = new MySqlDataAdapter();
         MySqlCommand cm = GetCommand(query, hsComm, conn);
         cm.ExecuteNonQuery();
         conn.Close();
        
     }

    private MySqlCommand GetCommand(string query,Hashtable hsComm,MySqlConnection conn)
    {
      MySqlCommand cm =  new MySqlCommand(query, conn);
      MySqlParameter[] paramList = GetParametersText(hsComm);
      foreach (var item in paramList)
      {
          cm.Parameters.Add(item);
      }
      return cm;
    }
    private MySqlParameter[] GetParametersText(Hashtable haspara)
    {
        MySqlParameter[] paramList = new MySqlParameter[haspara.Count];
        int i = 0;
        MySqlParameterCollection parameters = new MySqlCommand().Parameters;
        foreach (DictionaryEntry item in haspara)
        {

            parameters.Add("?" + item.Key, MySqlDbType.String).Value = item.Value.ToString().Trim();

            i++;
            // parameters.Clear();
        }

        parameters.CopyTo(paramList, 0);
        parameters.Clear();
        return paramList;
    }

}

