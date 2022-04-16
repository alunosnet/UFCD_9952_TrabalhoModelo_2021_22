using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFCD_9952_TrabalhoModelo_2021_22.Admin.Quartos
{
    public partial class adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //testar se o utilizador é admin
            if (Session["perfil"] == null || Session["perfil"].Equals("A") == false)
                Response.Redirect("/index.aspx");
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FileUpload foto = FormView1.FindControl("Fotografia") as FileUpload;
            if (foto.HasFile)
                e.Values["fotografia"] = foto.FileBytes;
        }
    }
}