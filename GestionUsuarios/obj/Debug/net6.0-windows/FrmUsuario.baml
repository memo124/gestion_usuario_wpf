   M S B A M L   `   `   `  ����J  FGestionUsuarios, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:GestionUsuariosGestionUsuarios  5   	        GestionUsuarios.FrmUsuario   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:GestionUsuarios     5   	     � Title$  
FrmUsuario��5   	   $	��450��6   $	��800��6)   .��5	      � $
��Left=�6   $	��Top=�6&   $	��372��6>   $	��372��6J   $��	21,10,0,8q�6W   .+�5
   
   �� -   5        $��lbTitulo��5
      $��Datos de Usuario��6    $��Center=�6;   $��	0, 21,0,0q�5      $	��Top=�6     J� RenderTransformOrigin$ -0.538,0.32&�68   $��20(�5      $��
UltraBlack"�6   �� 5   
   -   5        $��lbNombre��5      $��Nombre:��6    $
��Left=�62   $��
44,100,0,0q�5      $	��Top=�6!   �� 5   
   -   5        $��
lbApellido��5      $��	Apellido:��6"   $
��Left=�66   $��
44,165,0,0q�5      $	��Top=�6!   $ 0.099,0.526&�69   �� 5   
   -   5        $��lbEmail��5      $��E-mail:��6   $
��Left=�61   $��
44,217,0,0q�5      $	��Top=�6!   �� 5   
   -   5        $��lbPais��5      $��Pais:��6   $
��Left=�6.   $��
44,279,0,0q�5      $	��Top=�6!   $ -0.883,-0.631&�69   �� 5   
   -   5         ��Name$ 	txtNombre��5      $
��Left=�6%   $��120,104,0,0q�6@    �� TextWrapping$
 Wrap=�5      $�� ��6!   $	��Top=�6)   $	��120��6A   ���	#FFEBEFBE6M   �� 5   
   -   5        $ txtApellido��5      $
��Left=�6'   $��120,173,0,0q�6B   $
 Wrap=�5      $�� ��6!   $	��Top=�6)   $	��120��6A   ���	#FFEBEFBE6M   �� 5   
   -   5        $ txtEmail��5      $
��Left=�6$   $��120, 221,0,0q�6?   $�� ��5      $	��Top=�6   $	��120��6-   ���	#FFEBEFBE69   �� 5   
   -	   5         ��Name$ btnRegistrar��5      $
��Left=�6'   $��290,106,0,0q�6B   $	��Top=�5      $ 
1.44,-0.64&�6%   $��65��5   (   $��50��64   .��5      �� $��74��6   .+�5      �� $��./imgs/guardar.png��6   $��44��64   $��34��6@   �� 5       �� 6   $�Guardar��6!   63   5!      5"      �� 5#   
   -
   5         ��Name$ cbPais��5#      $
��Left=�6#   $��120,281,0,0q�6>   $	��Top=�6S   $	��120��6k   5$      5%      