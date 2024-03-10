using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionUsuarios
{
     public class DBConnection
    {
        private string ConnectionString = "Data Source = LAPTOP-O8SAEK9T;Initial Catalog=GestionUsuarios;User=sa;Password=sa;Integrated Security=false;MultipleActiveResultSets=true; TrustServerCertificate=True;";
        public SqlConnection ObtenerConexion()
        {
            SqlConnection conection = new SqlConnection(ConnectionString);
            return conection;
        }

    }
}
