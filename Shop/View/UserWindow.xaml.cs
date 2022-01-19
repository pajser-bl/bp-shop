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
    /// Interaction logic for UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        ProductMapper productMapper;

        public UserWindow(User user)
        {
            InitializeComponent();
            this.productMapper = new ProductMapper(Utils.GetSqlSession());
            updateProductTree();
            updateProducts();
        }

        public void updateProductTree()
        {
            ProductTypeTree.Items.Clear();
            foreach (ProductType a in Utils.getProductTypesTree())
            {
                ProductTypeTree.Items.Add(a);
            }
        }

        public void updateProducts(ProductType productType = null)
        {
            if (productType != null) { 
                
            } else { 
            
            }
        }

        private void ShoppingCart_Click(object sender, RoutedEventArgs e)
        {
           
        }

        private void ProductTypeTree_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            updateProducts((ProductType)ProductTypeTree.SelectedItem);
        }
    }
}
