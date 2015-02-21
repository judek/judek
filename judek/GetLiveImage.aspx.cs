using System;
using System.IO;
using System.Net;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace judek
{
    public partial class GetLiveImage : System.Web.UI.Page
    {
        bool ThumbnailCallback()
        {
            return true;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            string filePath = Server.MapPath(@"../../iplogger/logs/31ashlawn.txt");
            //string filePath = Server.MapPath(@"31ashlawn.txt");

            string fileContents = File.ReadAllText(filePath);
            string serverName = fileContents.Split(' ')[0];

            
            string CarmearID = Request.QueryString["id"];
            if (string.IsNullOrEmpty(CarmearID))
                return;

            
            //string imageURL = "http://" + "24.1.52.32" + ":5000/cgi-bin/CGIProxy.fcgi?cmd=snapPicture2&usr=visitor&pwd=visiTor";
            string imageURL = "http://" + serverName + ":" + CarmearID + "/cgi-bin/CGIProxy.fcgi?cmd=snapPicture2&usr=visitor&pwd=visiTor";

            CredentialCache credentialCache = new CredentialCache();

            
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(imageURL);
            //request.Proxy = new WebProxy("http://proxy.taltrade.com:8080/");
            request.Credentials = credentialCache;



            //Ignore SSL certification error for now.
            //ServicePointManager.ServerCertificateValidationCallback = ((sender2, certificate, chain, sslPolicyErrors) => true);

            
            HttpWebResponse cameraResponse = null;
            System.Drawing.Image liveImage = null;
            Graphics canvas = null;
            Font wmFont = null;

            try
            {

                try
                {
                    cameraResponse = (HttpWebResponse)request.GetResponse();
                }
                catch //Something went wrong
                {
                    if (null != cameraResponse)
                    {
                        cameraResponse.Close();
                        cameraResponse = null;
                    }
                }

                if (null != cameraResponse)
                {
                    liveImage = System.Drawing.Image.FromStream(cameraResponse.GetResponseStream());

                    string width = Request.QueryString["w"];
                    string height = Request["h"];


                    if ((false == string.IsNullOrEmpty(width)) || (false == string.IsNullOrEmpty(height)))
                    {
                        liveImage = liveImage.GetThumbnailImage(640, 360, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);
                    }
                }
                else
                {
                    liveImage = System.Drawing.Image.FromFile(Server.MapPath("picts/noCamera640.jpg"));
                }

                //Resize
                //liveImage = liveImage.GetThumbnailImage(1080, 607, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);
                
                //Add Time Stamp
                //if (null != cameraResponse)
                //{
                //    string strTimeStamp = DateTime.Now.ToLongDateString() + " " + DateTime.Now.ToLongTimeString();

                //    canvas = Graphics.FromImage(liveImage);
                //    wmFont = new Font("Verdana", 9, FontStyle.Bold);

                //    canvas.DrawString(strTimeStamp, wmFont, new SolidBrush(Color.Lime), 0, 0);
                //    canvas.DrawString(strTimeStamp, wmFont, new SolidBrush(Color.FromArgb(128, 0, 0, 0)), 2, 2);
                //    canvas.DrawString(strTimeStamp, wmFont, new SolidBrush(Color.FromArgb(128, 255, 255, 255)), 0, 0);
                //    canvas.DrawString(strTimeStamp, wmFont, new SolidBrush(Color.FromArgb(128, 0, 0, 0)), 2, 2);
                //    canvas.DrawString(strTimeStamp, wmFont, new SolidBrush(Color.FromArgb(128, 255, 255, 255)), 0, 0);
                //}

                Response.ContentType = "image/Jpeg";
                liveImage.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);

            
            }
            catch (Exception exp)
            {
                Response.Write(string.Format("Unexpected error<br>{0}", exp.Message));
            }
            finally
            {
                if (null != cameraResponse)
                    cameraResponse.Close();

                if (null != liveImage)
                    liveImage.Dispose();

                if (null != canvas)
                    canvas.Dispose();

                if (null != wmFont)
                    wmFont.Dispose();

                
            }
        }

        string GetIPAddress(string sfileName)
        {

            return null;

        }
    }
}
