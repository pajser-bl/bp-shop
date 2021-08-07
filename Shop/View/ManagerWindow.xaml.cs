using Shop.DAO;
using Shop.DAO.Mappers;
using Shop.DAO.Models.Shop;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Input;

namespace Shop.View
{
    /// <summary>
    /// Interaction logic for ManagerWindow.xaml
    /// </summary>
    public partial class ManagerWindow : Window
    {
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
            Products.ItemsSource = this.productMapper.Select(out _).ToList();
            Console.WriteLine(Products.Items);
        }


        public void updateProductTree()
        {
            ProductTypeTree.Items.Clear();
            foreach (ProductType a in Utils.getProductTypesTree())
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
            EditProductWindow _new = new EditProductWindow(null);
            _new.ShowDialog();
            updateProducts();
        }

        private void Products_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            Product selected = (Product)Products.SelectedItem;
            EditProductWindow _new = new EditProductWindow(selected);
            _new.ShowDialog();
            updateProducts();
        }

    }
}
