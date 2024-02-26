using Lopushok.DB;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.IO;
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

namespace Lopushok.Pages
{
    /// <summary>
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {

        public MainPage()
        {
            InitializeComponent();
            ProductCB.ItemsSource = App.connection.Product.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var window = new OpenFileDialog();

            if (window.ShowDialog() != true)
            {
                MessageBox.Show("Изображение не выбрано");
                return;
            }
            Product pr = ProductCB.SelectedItem as Product;

            pr.Image = File.ReadAllBytes(window.FileName);
            App.connection.Product.AddOrUpdate(pr);
            App.connection.SaveChanges();
            MessageBox.Show("успешно обновили фотку");
        }
    }
}
