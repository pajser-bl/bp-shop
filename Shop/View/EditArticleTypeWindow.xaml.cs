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
    /// Interaction logic for EditArticleTypeWindow.xaml
    /// </summary>
    public partial class EditArticleTypeWindow : Window
    {
        private ProductType productType;
        private List<ProductType> allProductTypes;
        private ProductTypeMapper productTypeMapper;
        public EditArticleTypeWindow(ProductType productType)
        {
            InitializeComponent();
            this.productTypeMapper = new ProductTypeMapper(Utils.GetSqlSession());
            this.productType = productType;
            this.allProductTypes = this.productTypeMapper.Select(out _);
            this.setProductType(this.productType);
        }

        public void setProductType(ProductType productType)
        {
            if (productType != null)
            {
                idTextBox.Text = productType.id !=null? productType.id.ToString(): "";
                nameTextBox.Text = productType.name != null ? productType.name.ToString() : "";
                descriptionTextBox.Text = productType.description != null ? productType.description.ToString() : "";
                if(productType.id_parent_product_type != null) { 
                    parentTypeComboBox.SelectedIndex = (int)productType.id_parent_product_type - 1;
                }
            }
        }
        private ProductType getProductType()
        {
            return new ProductType
            {
                name = nameTextBox.Text,
                description = descriptionTextBox.Text,
                id_parent_product_type = parentTypeComboBox.SelectedIndex + 1
            };

        }
        private void saveButton_Click(object sender,RoutedEventArgs e)
        {
            ProductType productType = getProductType();
            this.Close();
        }

    }
}
