namespace TALLERVEHICULOS.Models
{
    public class Sell
    {

        public int Id { get; set; } 
        public double SellTotal { get; set; }
        public int Amount { get; set; }

        //Relacion
            public int VehicleId { get; set; }
        public Vehicle Vehicle { get; set; }
    }

}
