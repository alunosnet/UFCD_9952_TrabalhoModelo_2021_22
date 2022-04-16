using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFCD_9952_TrabalhoModelo_2021_22.Func.Estadias
{
    public partial class Saida : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //testar se o utilizador é admin ou funcionário
            if (Session["perfil"] == null ||
                Session["perfil"].Equals("C"))
                Response.Redirect("/index.aspx");
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("estadias.aspx");
        }
    }
}