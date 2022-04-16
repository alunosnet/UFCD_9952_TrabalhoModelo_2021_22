using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UFCD_9952_TrabalhoModelo_2021_22
{
    public partial class registo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //valor do cp
            string cp = args.Value;

            //validar que o cp tem um tracinho

            //validar que o tracinho está no 5º espaço
            int i = cp.IndexOf('-');
            if ( i != 4 )
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //data de nascimento
            DateTime data_nascimento = DateTime.Parse(args.Value);

            //calcular idade
            TimeSpan idade = DateTime.Now - data_nascimento;

            double idade_anos = idade.TotalDays / 365;

            if (idade_anos < 18 || idade_anos >150)
                args.IsValid = false;
            else
                args.IsValid = true;
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //email
            string email = args.Value;

            //consultar a bd 
            string strligacao = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            SqlConnection ligacaoBD = new SqlConnection(strligacao);
            ligacaoBD.Open();

            string sql = $"SELECT * FROM Utilizadores WHERE Email='{email}'";

            SqlCommand comando = new SqlCommand(sql, ligacaoBD);
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