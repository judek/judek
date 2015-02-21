using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace judek
{
    public partial class GalleryEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["EditjudekGallery"] = "OK";
            Response.Redirect("gallery.aspx?ticks=" + DateTime.Now.Date.Ticks);
        }
    }
}
