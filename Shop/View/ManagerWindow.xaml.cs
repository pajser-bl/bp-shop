using Shop.DAO;
using Shop.DAO.Mappers;
using Shop.DAO.Models.Shop;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Shop.View
{
    /// <summary>
    /// Interaction logic for ManagerWindow.xaml
    /// </summary>
    public partial class ManagerWindow : Window
    {

        private ProductTypeMapper productTypeMapper;
        private ProductMapper productMapper;
        public ManagerWindow(User user)
        {
            InitializeComponent();
            //ProductTypeTree.ItemsSource 
        }
    }
}
