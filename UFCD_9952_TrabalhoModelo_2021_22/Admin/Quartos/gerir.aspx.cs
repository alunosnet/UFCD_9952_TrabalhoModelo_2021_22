using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFCD_9952_TrabalhoModelo_2021_22.Admin.Quartos
{
    public partial class gerir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //testar se o utilizador é admin
            if (Session["perfil"] == null || Session["perfil"].Equals("A") == false)
                Response.Redirect("/index.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //para cada linha adicionada à grid
            if(e.Row.RowType==DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                if(dr["fotografia"] is DBNull==false)
                {
                    string imagem = "data:image/jpg;base64, " +
                        Convert.ToBase64String((byte[])dr["fotografia"]);
                    (e.Row.FindControl("fotografia") as Image).ImageUrl = imagem;
                }
            }
        }
    }
}