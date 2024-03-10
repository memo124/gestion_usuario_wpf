using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace GestionUsuarios
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            CargarDatos();
        }

        public void CargarDatos()
        {
            UsuarioDto usuarioDto = new UsuarioDto();
            dgUsuarios.ItemsSource = usuarioDto.Obtener();
        }

        private void btnNuevo_Click(object sender, RoutedEventArgs e)
        {
            FrmUsuario frm = new FrmUsuario();
            frm.ShowDialog();
            CargarDatos();
        }

        private void dgUsuarios_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
        }

        private int ObtenerIdSeleccionado()
        {
            var selected = dgUsuarios.SelectedItems;
            foreach (var item in selected)
            {
                var usr = item as UsuarioDto;
                return usr.Id;
            }
            return -1;
        }

        private void btnEditar_Click(object sender, RoutedEventArgs e)
        {
            int id = ObtenerIdSeleccionado();
            if(id == -1) {
                MessageBox.Show("No se ha seleccionado registro a editar");
            }

            FrmUsuario frmUsuario = new FrmUsuario(id);
            frmUsuario.ShowDialog();
            CargarDatos();
        }

        private void btnEliminar_Click(object sender, RoutedEventArgs e)
        {

            int id = ObtenerIdSeleccionado();
            if (id == -1)
            {
                MessageBox.Show("No se ha seleccionado registro a editar");
            }
            try
            {
                var result = MessageBox.Show("Deseas eliminar este registro?","Gestion de usuario",MessageBoxButton.YesNo,MessageBoxImage.Question);
                if (result == MessageBoxResult.Yes)
                {
                    UsuarioDto usuarioDto = new UsuarioDto();
                    usuarioDto.Eliminar(id);
                    MessageBox.Show("Usuario eliminado con exito");
                    CargarDatos();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error: " + ex.Message);

            }
            
        }
    }
}
