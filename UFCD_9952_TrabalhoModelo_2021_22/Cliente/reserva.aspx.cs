using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFCD_9952_TrabalhoModelo_2021_22.Cliente
{
    public partial class reserva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //testar se o utilizador é cliente
            if (Session["perfil"] == null ||
                Session["perfil"].Equals("C")==false)
                Response.Redirect("/index.aspx");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //id_quarto
            DropDownList dd = FormView1.FindControl("DropDownList1") as DropDownList;
            int id_quarto = int.Parse(dd.SelectedValue);

            //data_entrada
            TextBox data_entrada = FormView1.FindControl("data_entradaTextBox") as TextBox;
            DateTime data_e = DateTime.Parse(data_entrada.Text);

            //data_saida
            TextBox data_saida = FormView1.FindControl("data_saidaTextBox") as TextBox;
            DateTime data_s = DateTime.Parse(data_saida.Text);

            if (data_e<DateTime.Now || data_s < DateTime.Now)
            {
                args.IsValid = false;
                return;
            }

            //consultar a bd 
            string strligacao = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection ligacaoBD = new SqlConnection(strligacao);
            ligacaoBD.Open();

            string sql = $@"select * from estadias
                    where (fase='RF' or fase='RC') AND (id_quarto=@quarto) AND
                    ((data_entrada>@data_entrada_reserva and data_entrada<@data_saida_reserva) OR 
                    (data_saida>@data_entrada_reserva and data_saida<@data_saida_reserva) OR	
                    (@data_entrada_reserva>data_entrada and @data_entrada_reserva<data_saida)	    
                    )";

            SqlCommand comando = new SqlCommand(sql, ligacaoBD);
            List<SqlParameter> lista = new List<SqlParameter>()
            {
                new SqlParameter("@quarto",id_quarto),
                new SqlParameter("@data_entrada_reserva",data_e),
                new SqlParameter("@data_saida_reserva",data_s)
            };
            comando.Parameters.AddRange(lista.ToArray());
            SqlDataReader dados = comando.ExecuteReader();

            //se existir um email igual
            if (dados.HasRows)
            {
                //não é válido
                args.IsValid = false;
            }
            else
            {
                //é válido
                args.IsValid = true;
            }
            ligacaoBD.Close();

        }
    }
}