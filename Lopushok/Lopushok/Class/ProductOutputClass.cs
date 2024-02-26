using Lopushok.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace Lopushok.Class
{
    public class ProductOutputClass
    {
        public Product product { get; set; }
        public string materials { get; set; }

        public int cost { get; set; }

        public ProductOutputClass(Product _product)
        {
            product = _product;
            List<Product_Material> matrsl = App.connection.Product_Material.Where(x => x.idProduct == _product.idProduct).ToList();
            foreach(var matr in matrsl)
            {
                materials += $"{App.connection.Material.FirstOrDefault(x => x.idMaterial == matr.idMaterial).Title}, ";
                cost += App.connection.Material.FirstOrDefault(x => x.idMaterial == matr.idMaterial).Cost;
        }
            materials.Remove(materials.Length - 2);  
        }
    }
}
