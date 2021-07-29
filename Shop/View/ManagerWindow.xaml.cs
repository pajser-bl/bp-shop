using Shop.DAO;
using Shop.DAO.Mappers;
using Shop.DAO.Models.Shop;
using System;
using System.Collections.Generic;
using System.Linq;
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
        List<ProductType> productTypes;
        List<Product> allProducts;
        ProductMapper productMapper;
       
        public ManagerWindow(User user)
        {
            InitializeComponent();
            this.productMapper = new ProductMapper(Utils.GetSqlSession());
            updateProductTree();
            updateProducts();
        }

        public void updateProducts()
        {
            this.allProducts = this.productMapper.Select(out _);
            Products.ItemsSource = this.allProducts.ToList();

        }


        public void updateProductTree()
        {
            ProductTypeTree.Items.Clear();
            this.productTypes = Utils.getProductTypesTree();
            foreach (ProductType a in productTypes)
            {
                ProductTypeTree.Items.Add(a);
            }
        }

        private void NewProductType_Click(object sender, RoutedEventArgs e)
        {
            EditArticleTypeWindow editArticleTypeWindow = new EditArticleTypeWindow(null);
            editArticleTypeWindow.ShowDialog();
            updateProductTree();
        }

        private void ProductType_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            EditArticleTypeWindow editArticleTypeWindow = new EditArticleTypeWindow((ProductType)ProductTypeTree.SelectedItem);
            editArticleTypeWindow.ShowDialog();
            updateProductTree();
        }

        private void NewProduct_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Products_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

        }

    }
}
