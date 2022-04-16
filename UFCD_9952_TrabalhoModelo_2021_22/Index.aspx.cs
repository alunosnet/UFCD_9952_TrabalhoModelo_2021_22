using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFCD_9952_TrabalhoModelo_2021_22
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfil"] != null)
                divlogin.Visible = false;
        }

        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
            //verificar se o login falhou
            if (DetailsView1.Rows.Count==0)
            {
                if (IsPostBack)
                    lbErro.Text = "Login falhou. Tente novamente";
            }
            else
            {
                //iniciar sessão 
                Session["id"] = DetailsView1.Rows[0].Cells[1].Text;
                Session["nome"]= DetailsView1.Rows[1].Cells[1].Text;
                Session["email"]= DetailsView1.Rows[2].Cells[1].Text;
                Session["perfil"]= DetailsView1.Rows[3].Cells[1].Text;

                //esconder div login
                divlogin.Visible = false;
            }
        }
    }
}