using ThreeOneSeven.Models;

namespace ThreeOneSeven
{
    public interface IProductRepository
    {
        public IEnumerable<Product> GetProducts();
        public Product GetProduct(int id);
        public void UpdateProduct(Product product);
        public void InsertProduct(Product productToInsert);
        public IEnumerable<Category> GetCategories();
        public Product AssignCategory();
        public void DeleteProduct(Product product);


    }
}
