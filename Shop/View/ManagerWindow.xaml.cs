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

        public ManagerWindow(User user)
        {
            InitializeComponent();
            List<ProductType> aa = Utils.getProductTypesTree();
            foreach (ProductType a in aa)
            {
                ProductTypeTree.Items.Add(a);
            }

        }
        private void ProductType_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            EditArticleTypeWindow editArticleTypeWindow = new EditArticleTypeWindow((ProductType)ProductTypeTree.SelectedItem);
            editArticleTypeWindow.ShowDialog();
            ProductTypeTree.Items.Clear();
            List<ProductType> aa = Utils.getProductTypesTree();
            foreach (ProductType a in aa)
            {
                ProductTypeTree.Items.Add(a);
            }
        }
        private void Products_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

        }

        private void NewProductType_Click(object sender, RoutedEventArgs e)
        {
            EditArticleTypeWindow editArticleTypeWindow = new EditArticleTypeWindow(null);
            editArticleTypeWindow.ShowDialog();
            ProductTypeTree.Items.Clear();
            List<ProductType> aa = Utils.getProductTypesTree();
            foreach (ProductType a in aa)
            {
                ProductTypeTree.Items.Add(a);
            }
        }
    }
}
