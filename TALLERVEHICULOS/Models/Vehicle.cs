namespace TALLERVEHICULOS.Models
{
    public class Vehicle
    {
        public int Id { get; set; }
        public string Type { get; set; }

        public int Year { get; set; }

        public int    Doors { get; set; }

        //RELACION
        public int BrandId { get; set; }
        public Brand Brand { get; set; }

        //LISTA
        public ICollection<Sell> Sells { get; set; }
    }
}
