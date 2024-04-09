using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


namespace validators_ex
{
    public partial class samplevalidatore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void save_Click(object sender, EventArgs e)
        {
            errorMsg.Text = "Validation successful";
            errorMsg.ForeColor = System.Drawing.Color.Green;
        }
    }
}