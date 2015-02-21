using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace judek
{
    public partial class movies : JudekPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelMain.Text = GetContent("Body");
        }
    }
}
