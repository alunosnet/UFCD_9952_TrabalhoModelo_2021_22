using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFCD_9952_TrabalhoModelo_2021_22
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //limpar os dados da sessão
            Session.Clear();

            //redirecionar para index
            Response.Redirect("index.aspx");
        }
    }
}