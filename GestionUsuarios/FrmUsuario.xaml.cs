using Microsoft.Identity.Client.NativeInterop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static System.Net.Mime.MediaTypeNames;

namespace GestionUsuarios
{
    /// <summary>
    /// Lógica de interacción para FrmUsuario.xaml
    /// </summary>
    public partial class FrmUsuario : Window
    {
        private int? Id;

        public FrmUsuario(int? id = null)
        {
            InitializeComponent();
            this.Id = id;

            paises paises = new paises();
            List<paises> lista = paises.obtener();
            cbPais.ItemsSource = lista;
            cbPais.DisplayMemberPath = "pais";
            cbPais.SelectedValuePath = "pais";
            if (id != null) CargarDatos();
        }

        public void CargarDatos()
        {
           UsuarioDto usuarioDto = new UsuarioDto();
            UsuarioDto usuario = usuarioDto.ObtenerUsuario(this.Id);
            txtNombre.Text = usuario.Nombre;
            txtApellido.Text = usuario.Apellido;
            txtEmail.Text = usuario.Email;
            cbPais.Text = usuario.Pais;
        }

        private void btnRegistrar_Click(object sender, RoutedEventArgs e)
        {
            UsuarioDto daoUsuario = new UsuarioDto();
            try
            {
                if (this.Id == null)
                {
 
                    daoUsuario.Agregar(txtNombre.Text, txtApellido.Text, txtEmail.Text, cbPais.SelectedValue.ToString());
                }
                if (this.Id != null)
                {
                    daoUsuario.Actualizar(txtNombre.Text, txtApellido.Text, txtEmail.Text, cbPais.SelectedValue.ToString(), (int)this.Id);
                }
                this.Close();
            }
            catch (Exception ex)
            {
                throw new Exception("Error: " + ex.Message);

            }
        }
    }
}
