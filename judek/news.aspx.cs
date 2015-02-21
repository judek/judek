using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.Caching;

namespace judek
{
    public partial class news : JudekPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelMain.Text = GetContent("Body");


            //Try loading news from cache first
            DataTable Ditems = Cache.Get("cache.News") as DataTable;

            //if (null == Ditems)
            //{//If not in cache go to the internet

            //    RssReader.RSSClient oRSSClient = new RssReader.RSSClient(
            //        "http://rss.news.yahoo.com/rss/mostviewed");

            //    Ditems = oRSSClient.Items;

            //    if (null == Ditems)
            //    {//If not in internet something is wrong
            //        LabelMain.Text = "No news items found.";
            //        return;
            //    }


            //    //Now that we got some new news cache it and continue
            //    Cache.Insert("cache.News", Ditems,
            //           null,
            //           DateTime.Now.AddHours(1), TimeSpan.Zero);

            //}



            //StringBuilder sb = new StringBuilder();
            ////pubDate

            //foreach (DataRow dr in Ditems.Rows)
            //{
            //    sb.Append("<span class=\"smalltitle\">[" + (dr["pubDate"] as string) + "]<br /><a href=\"" + (dr["link"] as string) + "\" target=\"_blank\">" + (dr["title"] as string) + "</a></span>");
            //    //sb.Append("<span class=\"subtitle\">" + (dr["title"] as string) + "</span> " + ("<span class=\"smalltext\">" + dr["pubDate"] as string) + "</span> ");
            //    //sb.Append("<br />" + (dr["description"] as string) + "<a href=\"" + (dr["link"] as string) + "\" target=\"_blank\">" + " <b>More...</a></b>");
            //    sb.Append("<br />" + (dr["description"] as string) + "</b>");
            //    sb.Append("<br /><br /><br />");
            //}

            //LabelMain.Text += sb.ToString();

        }
    }
}
