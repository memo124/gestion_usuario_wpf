   M S B A M L   `   `   `  ����J  FGestionUsuarios, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:GestionUsuariosGestionUsuarios  5   	        GestionUsuarios.MainWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:GestionUsuarios     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)    � WindowStartupLocation$ CenterScreen=�65   .��5	      � $��	0,10,23,9q�6   .+�5
   
   &   System.Windows.Controls.DataGrid  -   5          Name$ 
dgUsuarios��5
      $��45,101, 30, 65q�5         SelectionMode$ Single=�6#      RowBackground
 �����   AlternatingRowBackground �	#FFE6E4AD   RowStyle 5      �� 5      5      �� 5   
   -   5         ��Name$ btnNuevo��5      $
��Left=�6#   $��
46, 17,0,0q�6>   $	��Top=�5   	   $��65��68   $��50��6D   .��5      �� $��74��6   .+�5      �� $��/imgs/nuevo.png��6   $��46��61   $��34��6=   �� 5      �� 6   $�Nuevo��6!   61   5      5      �� 5   
   -   5        $ 	btnEditar��5      $
��Left=�6$   $��
141,16,0,0q�6?   $	��Top=�5   	   $��65��69   $��50��6E   .��5      �� $��74��6   .+�5       �� $��/imgs/editar.png��6   $��46��62   $��34��6>   �� 5!      �� 6   $�Editar��6!   62   5"      5$      �� 5%   
   -   5        $ btnEliminar��5%      $
��Left=�6&   $��
232,16,0,0q�6A   $	��Top=�5&   	   $��65��6;   $��50��6G   .��5(      �� $��74��6   .+�5)      �� $��/imgs/eliminar.png��6   $��46��64   $��34��6@   �� 5*      �� 6   $�Eliminar��6!   64   5+      5-      5/      50      