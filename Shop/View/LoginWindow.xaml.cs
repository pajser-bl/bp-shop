using Shop.DAO;
using Shop.View;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Shop
{

    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
            Utils.TestSQLConnection();
        }
        private void StackPanel_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Return)
            {
                Login();
            }
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Login();
        }

        private void Login()
        {
            User user = Auth.Login(username.Text, password.Password);
            if (user == null)
            {
                username.BorderBrush = System.Windows.Media.Brushes.Red;
                password.BorderBrush = System.Windows.Media.Brushes.Red;
            }
            else
            {
                switch (user.id_role)
                {
                    case 1:
                        {
                            AdminWindow window = new AdminWindow(user);
                            window.Show();
                            break;
                        }
                    case 2:
                        {
                            ManagerWindow window = new ManagerWindow(user);
                            window.Show();
                            break;
                        }
                    case 3:
                        {
                            UserWindow window = new UserWindow(user);
                            window.Show();
                            break;
                        }
                }
                this.Close();
            }


        }
    }
}
