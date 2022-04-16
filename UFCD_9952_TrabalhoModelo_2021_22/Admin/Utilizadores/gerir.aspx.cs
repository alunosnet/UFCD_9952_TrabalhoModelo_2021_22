using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFCD_9952_TrabalhoModelo_2021_22.Admin.Utilizadores
{
    public partial class gerir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //testar se o utilizador é admin
            if (Session["perfil"] == null || Session["perfil"].Equals("A") == false)
                Response.Redirect("/index.aspx");
        }
    }
}