using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace judek
{
    public partial class LiveCam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string GetHomeServerIP(string serverName)
        {
            //For jude.com
            string filePath = Server.MapPath(@"../../iplogger/logs/" + serverName + ".txt");

            //For development on localhost
            //string filePath = Server.MapPath(serverName + ".txt");

            string fileContents = File.ReadAllText(filePath);
            string serverIp = fileContents.Split(' ')[0];

            return serverIp;
        }
    }
}
