using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionUsuarios
{
    internal class paises
    {
        public List<paises> obtener()
        {
            DBConnection conn = new DBConnection();
            List<paises> paises = new List<paises>();
            string query = "SELECT * FROM paises";
            using (SqlConnection connection = conn.ObtenerConexion())
            {
                SqlCommand command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        paises pais = new paises();
                        pais.id = reader.GetInt32(0);
                        pais.pais = reader.GetString(1);
                        paises.Add(pais);
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    throw new Exception("Error: " + ex.Message);
                }
            }
            return paises;
        }
        public int id { get; set; }
        public string pais { get; set; }
    }
}
