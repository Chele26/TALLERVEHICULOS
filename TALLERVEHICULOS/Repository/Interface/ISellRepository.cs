using TALLERVEHICULOS.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace TALLERVEHICULOS.Interfaces
{
    public interface ISellRepository
    {
        Task<IEnumerable<Sell>> GetAllSellsAsync();
        Task<Sell> GetSellByIdAsync(int id);
        Task AddSellAsync(Sell sell);
        Task UpdateSellAsync(Sell sell);
        Task DeleteSellAsync(int id);
    }
}
