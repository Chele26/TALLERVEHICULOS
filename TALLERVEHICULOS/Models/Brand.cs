namespace TALLERVEHICULOS.Models
{
    public class Brand
    {
        
        public int Id { get; set; }
        public string Name { get; set; }

        //Lista

        public ICollection<Vehicle> Vehicles { get; set; }
    }
}
