using Shop.DAO;
using System;
using System.Collections.Generic;
using System.Data;
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
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        private UserMapper userMapper;
        private readonly User _user;
        public AdminWindow(User user)
        {
            InitializeComponent();
            userMapper = new UserMapper(Utils.GetSqlSession());
            Users.ItemsSource = userMapper.Select(out _).ToList();
            _user = user;
        }
        private void UserSearchButton_Click(object sender, RoutedEventArgs e)
        {
            Users.ItemsSource = userMapper.SelectByString(UsernameSearch.Text, out _).ToList();
        }

        private void Users_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            User selected = (User)Users.SelectedItem;
            EditUserWindow edit = new EditUserWindow(selected);
            edit.Show();
        }
        private void NewUserHandler(object sender, RoutedEventArgs e){
            EditUserWindow _new = new EditUserWindow(null);
            _new.ShowDialog();
            Users.ItemsSource = userMapper.Select(out _).ToList();
        }

        
    }

}
