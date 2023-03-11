using Dapper;
using System.Data;
using ThreeOneSeven.Models;

namespace ThreeOneSeven
{
    public class ProductRepository : IProductRepository
    {
        private readonly IDbConnection _conn;

        public ProductRepository(IDbConnection conn)
        {
            _conn = conn;
        }

        public IEnumerable<Product> GetProducts()
        {
            return _conn.Query<Product>("SELECT * FROM products");
        }

        public Product GetProduct(int id)
        {
            return _conn.QuerySingle<Product>("SELECT * FROM PRODUCTS WHERE PRODUCTID = @id",
                new { id = id });
        }

        public void UpdateProduct(Product product)
        {
            _conn.Execute("UPDATE products SET Name = @name, Price = @price, AmazonPrice = @amazonprice, StockLevel = @stocklevel WHERE ProductID = @id",
                new { name = product.Name, price = product.Price, amazonPrice = product.AmazonPrice, stocklevel = product.StockLevel, id = product.ProductID });
        }

        public void InsertProduct(Product productToInsert)
        {
            _conn.Execute("INSERT INTO products (NAME, PRICE, AMAZONPRICE, STOCKLEVEL, CATEGORYID) VALUES (@name, @price, @amazonprice, @stocklevel, @categoryID);",
                new { name = productToInsert.Name, price = productToInsert.Price, amazonPrice = productToInsert.AmazonPrice, stockLevel = productToInsert.StockLevel, categoryID = productToInsert.CategoryID });

        }

        public IEnumerable<Category> GetCategories()
        {
            return _conn.Query<Category>("SELECT * FROM categories;");
        }

        public Product AssignCategory()
        {
            var categoryList = GetCategories();
            var product = new Product();
            product.Categories = categoryList;

            return product;
        }

        public void DeleteProduct(Product product)
        {
            _conn.Execute("DELETE FROM Products WHERE ProductID = @id;",
                                       new { id = product.ProductID });
        }


    }
}
