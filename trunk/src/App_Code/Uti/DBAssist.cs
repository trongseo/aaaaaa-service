using System;
using System.Collections.Generic;
using System.Text;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class DBAssist
{
    private SqlConnection m_Connection;
    private string m_ConnectionString = string.Empty;

    public DBAssist(string connecstr)
    {
        if (m_ConnectionString == string.Empty)
            m_ConnectionString = connecstr;
    }
    public DBAssist()
    {
        if (m_ConnectionString == string.Empty)
            m_ConnectionString = "";
    }
    public string ConnectionString
    {
        get
        {
            if (m_ConnectionString == string.Empty)
                m_ConnectionString = "";
            return m_ConnectionString;
        }
        set
        {
            m_ConnectionString = value;
        }
    }
    public SqlConnection Connection
    {
        get
        {
            m_Connection = new SqlConnection(ConnectionString);
            return m_Connection;
        }
    }

    public void OpenConnection()
    {
        OpenConnection(Connection);
    }

    public void OpenConnection(SqlConnection connection)
    {
        try
        {
            if (connection.State == ConnectionState.Closed || connection.State == ConnectionState.Broken)
                connection.Open();
        }
        catch (System.Exception e)
        {
            //Log.Logger.LogError("Open DB Connection Error. Couln't establish connection to DB.", e);
        }
    }

    public void CloseConnection()
    {
        CloseConnection(Connection);
    }

    public void CloseConnection(SqlConnection connection)
    {
        try
        {
            if (connection.State != ConnectionState.Closed || connection.State != ConnectionState.Broken)
                connection.Close();
        }
        catch (System.Exception e)
        {
            //Log.Logger.LogError("Close DB Connection Error. Couln't establish connection to DB.", e);
        }
    }

    public SqlTransaction StartTransaction()
    {
        return StartTransaction(Connection);
    }

    public SqlTransaction StartTransaction(SqlConnection connection)
    {
        OpenConnection(connection);
        SqlTransaction transaction;
        // Start a local transaction.
        transaction = connection.BeginTransaction();
        return transaction;
    }

    public SqlTransaction StartTransaction(string connectionString)
    {
        SqlConnection connection = new SqlConnection(connectionString);

        return StartTransaction(connection);
    }

    public void RollbackTransaction(SqlTransaction transaction)
    {
        try
        {
            transaction.Rollback();
        }
        catch (Exception ex)
        {
            //Log error
        }
			finally //we close the connection as well
        {
            CloseConnection(transaction.Connection);
        }
    }

    public void CommitTransaction(SqlTransaction transaction)
    {
        try
        {
            transaction.Commit();
        }
        catch (Exception ex)
        {
            RollbackTransaction(transaction);
            //Log error
        }
			finally //we close the connection as well
        {
            CloseConnection(transaction.Connection);
        }
    }
}

