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
    /// Interaction logic for EditArticleTypeWindow.xaml
    /// </summary>
    public partial class EditArticleTypeWindow : Window
    {
        private ProductType productType;
        private List<ProductType> productTypes;
        private ProductTypeMapper productTypeMapper;
        public EditArticleTypeWindow(ProductType productType)
        {
            InitializeComponent();
            this.productTypeMapper = new ProductTypeMapper(Utils.GetSqlSession());
            this.productType = productType;
            this.productTypes = this.productTypeMapper.Select(out _);
            parentTypeComboBox.ItemsSource = this.productTypes;
            this.setProductType(this.productType);
            deleteButton.IsEnabled = productType != null?true: false;
        }

        public void setProductType(ProductType productType)
        {
            if (productType != null)
            {
                idTextBox.Text = productType.id !=null? productType.id.ToString(): "";
                nameTextBox.Text = productType.name != null ? productType.name.ToString() : "";
                descriptionTextBox.Text = productType.description != null ? productType.description.ToString() : "";
                if(productType.id_parent_product_type != null) { 
                    parentTypeComboBox.SelectedIndex = this.productTypes.FindIndex(_productType=>_productType.id==productType.id_parent_product_type);
                }
            }
        }
        private ProductType getProductType()
        {
            ProductType returnValue =  new ProductType
            {
                name = nameTextBox.Text,
                description = descriptionTextBox.Text
            };
            if(parentTypeComboBox.SelectedItem != null)
            {
                returnValue.id_parent_product_type = ((ProductType)parentTypeComboBox.SelectedItem).id;
            }
            return returnValue;

        }
        private void saveButton_Click(object sender,RoutedEventArgs e)
        {
            ProductType productType = getProductType();
            if(productType.id == null) {
                this.productTypeMapper.Create(productType, out _);
            }
            else {
                this.productTypeMapper.Update(productType, out _);
            }
            this.Close();
        }

        private void deleteButton_Click(object sender, RoutedEventArgs e)
        {
            if(!this.productTypeMapper.Delete(productType, out _)) {
                MessageBox.Show("Unable to delete product type with subtypes.");
            }
            this.Close();
        }
    }
}
