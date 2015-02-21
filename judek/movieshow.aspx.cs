using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace judek
{
    public partial class movieshow : System.Web.UI.Page
    {
   
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            EnalbeEdits((null != Session["EditjudekGallery"]));

            if (null == Request.QueryString["movie"])
                return;


            string sMoviePath = "/videos/" + Request.QueryString["movie"] + ".txt";

            LiteralDescription.Text = ContentReader.GetContent(Server.MapPath(sMoviePath));
            TextBoxDescription.Text = ContentReader.GetContent(Server.MapPath(sMoviePath), Request.QueryString["movie"], true);
            ViewState["sMoviePath"] = sMoviePath;

        }
        void EnalbeEdits(bool blnEnable)
        {
            TextBoxDescription.Visible = blnEnable;
            ButtonSave.Visible = blnEnable;
        }

        protected void ButtonDone_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movies.aspx");
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            string sMoviePath = (string)ViewState["sMoviePath"];

            if (sMoviePath == null)
                return;

            ContentReader.SetContent(Server.MapPath(sMoviePath),
                TextBoxDescription.Text);
        }
    }
}
