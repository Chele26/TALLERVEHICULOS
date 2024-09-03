using TALLERVEHICULOS.Data;
using TALLERVEHICULOS.Interfaces;
using TALLERVEHICULOS.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TALLERVEHICULOS.Repository
{
    public class SellRepository : ISellRepository
    {
        private readonly AppDbContext _context;

        public SellRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Sell>> GetAllSellsAsync()
        {
            return await _context.Sells.Include(s => s.Vehicle).ToListAsync();
        }

        public async Task<Sell> GetSellByIdAsync(int id)
        {
            return await _context.Sells.Include(s => s.Vehicle).FirstOrDefaultAsync(s => s.Id == id);
        }

        public async Task AddSellAsync(Sell sell)
        {
            await _context.Sells.AddAsync(sell);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateSellAsync(Sell sell)
        {
            _context.Sells.Update(sell);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteSellAsync(int id)
        {
            var sell = await _context.Sells.FindAsync(id);
            if (sell != null)
            {
                _context.Sells.Remove(sell);
                await _context.SaveChangesAsync();
            }
        }
    }
}
