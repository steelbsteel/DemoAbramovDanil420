using Lopushok.Class;
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

        List<ProductOutputClass> prInfoList = new List<ProductOutputClass>();
        public MainPage()
        {
            InitializeComponent();
            var prList = App.connection.Product.ToList();
            foreach(var product in prList)
            {
                prInfoList.Add(new ProductOutputClass(product));
            }
            ProductList.ItemsSource = prInfoList;
        }

        private void SearchTB_TextChanged(object sender, TextChangedEventArgs e)
        {
            var list = App.connection.Product.ToList();
            var newlist = new List<ProductOutputClass>();
            foreach(var item in list)
            {
                if (item.Title.ToLower().Contains(SearchTB.Text.ToLower()))
                {
                    newlist.Add(new ProductOutputClass(item));
                }
            }
            ProductList.ItemsSource = newlist;

            if(SearchTB.Text == "")
            {
                ProductList.ItemsSource = prInfoList;
            }
        }
    }
}
