using Shop.DAO;
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
    /// Interaction logic for EditUserWindow.xaml
    /// </summary>
    public partial class EditUserWindow : Window
    {
        private User user;
        private List<string> roles;
        private List<string> locations;
        private UserMapper userMapper;
        public EditUserWindow(User selected)
        {
            InitializeComponent();
            this.userMapper = new UserMapper(Utils.GetSqlSession());
            this.user = selected;
            this.roles = Auth.GetRolesNames();
            this.locations = Auth.GetLocationsNames();
            roleComboBox.ItemsSource = this.roles.ToArray();
            locationComboBox.ItemsSource = this.locations.ToArray();
            this.SetUser(this.user);
        }

        private void SetUser(User user)
        {
            if (user != null)
            {
                idTextBox.Text = user.id != null ? user.id.ToString() : "";
                usernameTextBox.Text = user.id != null ? user.username.ToString() : "";
                firstTextBox.Text = user.first_name != null ? user.first_name.ToString() : "";
                lastTextBox.Text = user.last_name != null ? user.last_name.ToString() : "";
                middleTextBox.Text = user.middle_name != null ? user.middle_name.ToString() : "";
                emailTextBox.Text = user.email != null ? user.email.ToString() : "";
                locationComboBox.SelectedIndex = user.id_location - 1;
                roleComboBox.SelectedIndex = user.id_role - 1;
                phoneTextBox.Text = user.phone!=null? user.phone:"";
            }
        }
        private User getUser()
        {
            User u = new User {
                username = usernameTextBox.Text,
                first_name = firstTextBox.Text,
                last_name = lastTextBox.Text,
                middle_name = middleTextBox.Text,
                email = emailTextBox.Text,
                id_location = locationComboBox.SelectedIndex + 1,
                id_role = roleComboBox.SelectedIndex + 1,
                phone = phoneTextBox.Text
            };

            if (idTextBox.Text != null && idTextBox.Text!="")
            {
                u.id = int.Parse(idTextBox.Text);
            }
            if (passordTextBox.Text!=null && passordTextBox.Text != "")
            {
                u.hash = Auth.Hash(passordTextBox.Text);
            }
            return u;
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            User user = getUser();
            if(user.hash=="" || user.hash == null)
            {
                passordTextBox.BorderBrush = System.Windows.Media.Brushes.Red;
            }
            else { 
                if (user.id!=null) {
                    this.userMapper.Update(user, out _);
                } else {
                    int id_user=this.userMapper.Create(user, out _);
                    Auth.CreateUserRole(user.id_role, id_user);
                }
                this.Close();
            }
        }
    }
}
