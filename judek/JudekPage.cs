using System;
using System.Collections.Generic;
using System.Web;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.OleDb;
using System.Data.Common;
using System.Web.Caching;
using System.Net.Mail;
using System.Net;
using System.Threading;
using System.Text;

namespace judek
{
    public class JudekPage : System.Web.UI.Page
    {
        DbConnection _DbConnection;
        DataSet _CalendarEvents;
        protected const string DATBASE_PATH = "~/database/JudekCalendar.mdb";


        public virtual DataSet CalendarEvents
        {

            get
            {
                _CalendarEvents = Cache.Get("cache.judek.CalendarEvents") as DataSet;
                if (null != _CalendarEvents)
                    return _CalendarEvents;


                //Refill cache then return events
                _DbConnection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                    Server.MapPath(DATBASE_PATH) + ";User Id=admin;Password=;");
                _DbConnection.Open();

                string sql = "SELECT * FROM CalendarEvents";

                DataAdapter da = new OleDbDataAdapter(sql, (OleDbConnection)_DbConnection);
                _CalendarEvents = new DataSet();
                da.Fill(_CalendarEvents);
                _DbConnection.Close();

                Cache.Insert("cache.judek.CalendarEvents", _CalendarEvents,
                    new CacheDependency(Server.MapPath(DATBASE_PATH)),
                    DateTime.Now.AddHours(1), TimeSpan.Zero);


                return _CalendarEvents;

            }

        }

        protected virtual string GetContent(string sPortion)
        {
            string sContent = "";


            string sFileName = System.IO.Path.GetFileName(Request.Url.AbsolutePath);

            if (false == sFileName.EndsWith(".aspx"))
                throw new ApplicationException("CafePage.GetContent():Unable to parse page name from url path");


            sFileName = sFileName.Replace(".aspx", "");

            string sSuffix = sFileName + "." + sPortion + ".txt";

            string sPrefix;

            if (Request.QueryString["preview"] != null)
                sPrefix = "./content/Preview.";
            else
            {
                sPrefix = "./content/Content.";
                sContent = Cache.Get(("cache." + (sPrefix + sSuffix))) as string;
                if (sContent != null)
                    return sContent;
            }

            try
            {
                sContent = ContentReader.GetContent(Server.MapPath(sPrefix + sSuffix));

                Cache.Insert(("cache." + (sPrefix + sSuffix)), sContent,
                new CacheDependency(Server.MapPath((sPrefix + sSuffix))),
                DateTime.Now.AddHours(1), TimeSpan.Zero);


                return sContent;
            }
            catch
            {
                return sContent;
            }





        }

        protected virtual string GenerageColorBar()
        {

            return "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\" class=\"gallery_menutable\"><tr><td align=\"right\" valign=\"top\">" +
                    "<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"printhide\"><tr><td width=\"1\">" +
                    "<img src=\"picts/spacer.gif\" height=\"10\" width=\"1\"><br />" +
                    "</td>" +
                    "<!-- <td><a href=\"specials.aspx\" class=\"menu-nav\">specials</a></td>" +
                    "<td><a href=\"menu.aspx\" class=\"menu-nav\">coupons</a></td>" +
                    "<td><a href=\"menu.aspx\" class=\"menu-nav\">coffee</a></td>" +
                    "<td><a href=\"menu.aspx\" class=\"menu-nav\">menu</a></td> -->" +
                    "</tr>" +
                    "</table>" +
                    "</td></tr></table>";

        }

        protected int ExecuteSQLNonQuery(string dbPath, string SQL)
        {
            OleDbCommand cmd = null;
            try
            {
                cmd = new OleDbCommand(SQL);

                return ExecuteSQLNonQuery(dbPath, cmd);
            }
            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                if (null != cmd)
                    cmd.Dispose();
            }


        }


        protected DataSet ExecuteSQLQuery(string dbPath, string SQL)
        {

            OleDbCommand cmd = null;
            try
            {
                cmd = new OleDbCommand(SQL);

                return ExecuteSQLQuery(dbPath, cmd);
            }
            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                if (null != cmd)
                    cmd.Dispose();
            }

        }


        protected DataSet ExecuteSQLQuery(string dbPath, OleDbCommand cmd)
        {
            DataSet dataset = new DataSet();

            OleDbConnection dbConnection = null;
            OleDbDataAdapter dap = null;


            try
            {
                lock (this)
                {

                    dbConnection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                                           Server.MapPath(dbPath) + ";User Id=admin;Password=;");

                    dap = new OleDbDataAdapter(cmd);

                    cmd.Connection = dbConnection;

                    dbConnection.Open();

                    dap.Fill(dataset);


                    return dataset;


                }
            }
            catch (Exception exp)
            {
                throw new Exception(exp.Message);
            }
            finally
            {
                if (null != dbConnection)
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                }

                if (null != dap)
                {
                    dap.Dispose();
                }

            }


        }


        protected int ExecuteSQLNonQuery(string dbPath, OleDbCommand cmd)
        {
            OleDbConnection dbConnection = null;

            int nResult = 0;

            try
            {
                lock (this)
                {

                    dbConnection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                                           Server.MapPath(dbPath) + ";User Id=admin;Password=;");

                    cmd.Connection = dbConnection;

                    dbConnection.Open();

                    nResult = cmd.ExecuteNonQuery();

                    dbConnection.Close();
                }
            }
            catch (Exception exp)
            {
                throw new Exception(exp.Message);
            }
            finally
            {
                if (null != dbConnection)
                {
                    dbConnection.Close();
                    dbConnection.Dispose();
                }
            }

            return nResult;
        }




        protected string StripString(string targetString)
        {//Simple method in C# to strip non-alphanumeric letters
            return System.Text.RegularExpressions.Regex.Replace(targetString, "[^A-Za-z0-9.]", "");
        }
       

      

       




       

    }
}
