using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using System.Web.Caching;

namespace judek
{
    public partial class viewEvent : JudekPage
    {

        int nEventID;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["ID"] == null)
                return;

            string stest = Request.QueryString["ID"];

            try { nEventID = Int32.Parse(Request.QueryString["ID"]); }
            catch { return; }


            DataRow[] drs = CalendarEvents.Tables[0].Select(string.Format("ID = {0}", nEventID));


            if (null == drs)
            {
                LabelSubject.Text = "Event Not Found";
                return;
            }

            if (drs.Length != 1)
            {
                LabelSubject.Text = "Unexpected number of events";
                return;
            }


            if ((int)drs[0]["CollectionID"] == -1)
                LabelDate.Text = ((DateTime)drs[0]["EventDate"]).ToLongDateString();
            else
            {

                LabelDate.Text = ((DateTime)drs[0]["EventDate"]).ToLongDateString();
            }

            if ((int)drs[0]["IsAllDayEvent"] == 0)
            {
                DateTime StartTime = (DateTime)drs[0]["EventTime"];
                DateTime EndTime = (DateTime)drs[0]["EventTime"];
                EndTime = EndTime.AddHours((int)drs[0]["LengthHrs"]);
                EndTime = EndTime.AddMinutes((int)drs[0]["LengthMins"]);

                LabelTimeSpan.Text = StartTime.ToShortTimeString() + " - " + EndTime.ToShortTimeString();
            }
            else
                LabelTimeSpan.Text = "All Day";



            LabelSubject.Text = drs[0]["Subject"] as string;
            //LabelDetails.Text = drs[0]["Details"] as string;
            TextBoxBody.Text = drs[0]["Details"] as string;



        }



    }
}
