using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Text.RegularExpressions;
using Shop.DAO.Models.Shop;
using Shop.DAO.Mappers;

namespace Shop.View
{

    public partial class EditProductWindow : Window
    {
        private Product product;
        private ProductMapper productMapper;
        private ProductTypeMapper productTypeMapper;
        public EditProductWindow(Product product)
        {
            InitializeComponent();
            this.productMapper = new ProductMapper(Utils.GetSqlSession());
            this.productTypeMapper = new ProductTypeMapper(Utils.GetSqlSession());
            productTypeComboBox.ItemsSource = this.productTypeMapper.Select(out _);
            this.product = product;
            setProduct(product);
            deleteButton.IsEnabled = product != null ? true : false;
        }

        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9.]+");
            e.Handled = regex.IsMatch(e.Text);

        }

    
        private void setProduct(Product product) {
            if (product != null) {
                idTextBox.Text = product.id != null ? product.id.ToString() : "";
                nameTextBox.Text = product.name != null ? product.name.ToString() : "";
                descriptionTextBox.Text = product.description!= null ? product.description.ToString() : "";
                productTypeComboBox.SelectedItem = product.id_product_type;
                priceTextBox.Text = product.price!= null ? product.description.ToString() : "0.0";
            }
            
        }

        private Product getProduct() {
            Product product = new Product
            {
                name = nameTextBox.Text,
                description = descriptionTextBox.Text,
                price = decimal.Parse(priceTextBox.Text),
                id_product_type = (int)((ProductType)productTypeComboBox.SelectedItem).id
            };
            return product;
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            Product product = getProduct();
            if (product.id == null)
            {
                this.productMapper.Create(product, out _);
            }
            else
            {
                this.productMapper.Update(product, out _);
            }
            this.Close();
        }

        private void deleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (!this.productMapper.Delete(product, out _))
            {
                MessageBox.Show("Unable to delete product type with subtypes.");
            }
            this.Close();
        }

    }
}
