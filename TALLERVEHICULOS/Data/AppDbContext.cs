using Microsoft.EntityFrameworkCore;
using TALLERVEHICULOS.Models;

namespace TALLERVEHICULOS.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
            
        }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<Vehicle> Vehicles { get; set; }
        public DbSet<Sell> Sells { get; set; }
        public object Brand { get; internal set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Brand>(tb =>
            {
                tb.HasAlternateKey(col => col.Id);

                tb.Property(Col => Col.Id)
                .UseIdentityColumn()
                .ValueGeneratedOnAdd();
            });
        }
    }
}
        