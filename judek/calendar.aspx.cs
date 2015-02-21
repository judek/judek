﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Data;
using System.Collections;
using System.Web.Caching;

namespace judek
{
    public partial class calendar : JudekPage
    {
        DateTime _dEasterDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            _dEasterDate = GetEasterDate(DateTime.Now.Year);
            //LabelTodayMessage.Text = "<span class=\"title\">Calendar</span><br /><img src=\"picts/small-windows.gif\" />Click on any event for more details<br /><br /><a href=\"" + HttpContext.Current.Request.FilePath + "\">Today is " + DateTime.Now.ToLongDateString() + "</a>";
            LabelTodayMessage.Text = "<a href=\"" + HttpContext.Current.Request.FilePath + "\">Today is " + DateTime.Now.ToLongDateString() + "</a>";
 
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            string sEvents = GetHolidaysForDay(e.Day.Date);

            sEvents += GetEventsForDay(e.Day.Date);

            e.Cell.Text = e.Day.Date.Day.ToString();

            if (sEvents.Length > 3)
                e.Cell.Text += sEvents;


        }

        bool DOW(int count, DayOfWeek DayOfWeek, DateTime day)
        {
            if (day.DayOfWeek != DayOfWeek)
                return false;

            DateTime refDay = day.AddDays(-((count - 1) * 7));

            if (refDay.Month != day.Month)
                return false;

            refDay = refDay.AddDays(-7);

            if (refDay.Month != day.Month)
                return true;
            else
                return false;

        }
        DateTime GetEasterDate(int y)
        {

            DateTime EasterDate = DateTime.Now;

            //Taken from
            //http://users.sa.chariot.net.au/~gmarts/eastcalc.htm

            switch (y)
            {
                case 1990: EasterDate = new DateTime(y, 4, 15); break;
                case 1991: EasterDate = new DateTime(y, 3, 31); break;
                case 1992: EasterDate = new DateTime(y, 4, 19); break;
                case 1993: EasterDate = new DateTime(y, 4, 11); break;
                case 1994: EasterDate = new DateTime(y, 4, 3); break;
                case 1995: EasterDate = new DateTime(y, 4, 16); break;
                case 1996: EasterDate = new DateTime(y, 4, 7); break;
                case 1997: EasterDate = new DateTime(y, 3, 30); break;
                case 1998: EasterDate = new DateTime(y, 4, 12); break;
                case 1999: EasterDate = new DateTime(y, 4, 4); break;
                case 2000: EasterDate = new DateTime(y, 4, 23); break;
                case 2001: EasterDate = new DateTime(y, 4, 15); break;
                case 2002: EasterDate = new DateTime(y, 3, 31); break;
                case 2003: EasterDate = new DateTime(y, 4, 20); break;
                case 2004: EasterDate = new DateTime(y, 4, 11); break;
                case 2005: EasterDate = new DateTime(y, 3, 27); break;
                case 2006: EasterDate = new DateTime(y, 4, 16); break;
                case 2007: EasterDate = new DateTime(y, 4, 8); break;
                case 2008: EasterDate = new DateTime(y, 3, 23); break;
                case 2009: EasterDate = new DateTime(y, 4, 12); break;
                case 2010: EasterDate = new DateTime(y, 4, 4); break;
                case 2011: EasterDate = new DateTime(y, 4, 24); break;
                case 2012: EasterDate = new DateTime(y, 4, 8); break;
                case 2013: EasterDate = new DateTime(y, 3, 31); break;
                case 2014: EasterDate = new DateTime(y, 4, 20); break;
                case 2015: EasterDate = new DateTime(y, 4, 5); break;
                case 2016: EasterDate = new DateTime(y, 3, 27); break;
                case 2017: EasterDate = new DateTime(y, 4, 16); break;
                case 2018: EasterDate = new DateTime(y, 4, 1); break;
                case 2019: EasterDate = new DateTime(y, 4, 21); break;
                case 2020: EasterDate = new DateTime(y, 4, 12); break;
                case 2021: EasterDate = new DateTime(y, 4, 4); break;
                case 2022: EasterDate = new DateTime(y, 4, 17); break;
                case 2023: EasterDate = new DateTime(y, 4, 9); break;
                case 2024: EasterDate = new DateTime(y, 3, 31); break;
                case 2025: EasterDate = new DateTime(y, 4, 20); break;
                case 2026: EasterDate = new DateTime(y, 4, 5); break;
                case 2027: EasterDate = new DateTime(y, 3, 28); break;
                case 2028: EasterDate = new DateTime(y, 4, 16); break;
                case 2029: EasterDate = new DateTime(y, 4, 1); break;
                case 2030: EasterDate = new DateTime(y, 4, 21); break;
                case 2031: EasterDate = new DateTime(y, 4, 13); break;
                case 2032: EasterDate = new DateTime(y, 3, 28); break;
                case 2033: EasterDate = new DateTime(y, 4, 17); break;
                case 2034: EasterDate = new DateTime(y, 4, 9); break;
                case 2035: EasterDate = new DateTime(y, 3, 25); break;
                case 2036: EasterDate = new DateTime(y, 4, 13); break;
                case 2037: EasterDate = new DateTime(y, 4, 5); break;
                case 2038: EasterDate = new DateTime(y, 4, 25); break;
                case 2039: EasterDate = new DateTime(y, 4, 10); break;
                case 2040: EasterDate = new DateTime(y, 4, 1); break;
                case 2041: EasterDate = new DateTime(y, 4, 21); break;
                case 2042: EasterDate = new DateTime(y, 4, 6); break;
                case 2043: EasterDate = new DateTime(y, 3, 29); break;
                case 2044: EasterDate = new DateTime(y, 4, 17); break;
                case 2045: EasterDate = new DateTime(y, 4, 9); break;
                case 2046: EasterDate = new DateTime(y, 3, 25); break;
                case 2047: EasterDate = new DateTime(y, 4, 14); break;
                case 2048: EasterDate = new DateTime(y, 4, 5); break;
                case 2049: EasterDate = new DateTime(y, 4, 18); break;
                case 2050: EasterDate = new DateTime(y, 4, 10); break;
                default:
                    break;
            }


            return EasterDate;

        }
        string GetHolidaysForDay(DateTime day)
        {

            int nMonth = day.Month;
            int nday = day.Day;

            string sEvents = "";

            if (nMonth == 1)
            {
                if (nday == 1)
                    sEvents += "<br />New Year's Day";


                //ML King 3rd Monday of Jan
                if (DOW(3, DayOfWeek.Monday, day))
                    sEvents += "<br />Martin Luther King Day";


            }


            if (nMonth == 2)
            {
                //Presidents Day 3rd Monday of Feb Mon, Feb 21st 
                if (DOW(3, DayOfWeek.Monday, day))
                    sEvents += "<br />Presidents Day";

            }


            if (nMonth == 3)
            {
                if (nday == 17)
                    sEvents += "<br />St Patrick's Day";

            }


            if ((nMonth == 3) || (nMonth == 4))
            {//check for easter

                if ((day.Month == _dEasterDate.Month) &&
                    (day.Date == _dEasterDate.Date) &&
                    (day.Year == _dEasterDate.Year))
                {
                    sEvents += "<br />Easter";
                }
            }

            if (nMonth == 10)
            {
                //Halloween
                if (nday == 31)
                    sEvents += "<br />Halloween";

                //Columbus Day 2nd Monday of Oct
                if (DOW(2, DayOfWeek.Monday, day))
                    sEvents += "<br />Columbus Day";

            }


            if (nMonth == 5)
            {
                //2nd Sunday of May Mother's Day
                if (DOW(2, DayOfWeek.Sunday, day))
                    sEvents += "<br />Mother's Day";

                //Memorial Day Last Monday of May Mon
                if (day.DayOfWeek == DayOfWeek.Monday)
                {
                    if (day.AddDays(7).Month != day.Month)
                        sEvents += "<br />Memorial Day";
                }

            }

            if (nMonth == 6)
            {
                //3rd Sunday of June as Father's Day
                if (DOW(3, DayOfWeek.Sunday, day))
                    sEvents += "<br />Father's Day";
            }


            if (nMonth == 7)
            {
                //Fouth of July
                if (nday == 4)
                    sEvents += "<br />Independance Day";
            }



            if (nMonth == 11)
            {
                if (nday == 11)
                {
                    sEvents += "<br />Veteran's Day";
                }

                if (day.DayOfWeek == DayOfWeek.Thursday)
                {
                    DateTime nextweek = day.AddDays(-21);
                    if (nextweek.Month == day.Month)
                    {
                        nextweek = nextweek.AddDays(-7);
                        if (nextweek.Month != day.Month)
                        {
                            sEvents += "<br />Thanksgiving";
                        }
                    }
                }

            }

            if (nMonth == 12)
            {
                if (nday == 25)
                    sEvents += "<br />Christmas";
            }


            return sEvents;
        }

        string GetEventsForDay(DateTime day)
        {
            string sEvents = "";
            DataRow[] drs = CalendarEvents.Tables[0].Select(string.Format("EventDate = '{0}-{1}-{2}'", day.Day, day.ToString("MMM"), day.Year));

            if (drs != null)
            {
                foreach (DataRow r in drs)
                {

                    //<a href=viewEvent.asp?ID=215&ColID=207 onclick="window.open(this.href,'newWindow','width=400,height=400', 'modal');return false">Winter Break </a>

                    string slink = "<a href=viewEvent.aspx?ID=" + r["ID"] + "&ColID=207 onclick=\"window.open(this.href,'newWindow','width=400,height=400', 'modal');return false\">";

                    sEvents += ("<br />" + slink + (r["Subject"] as string) + "</a>");
                }
            }

            return sEvents;
        }

        protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            _dEasterDate = GetEasterDate(Calendar1.VisibleDate.Year);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}
