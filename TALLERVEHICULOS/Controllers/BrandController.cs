    using Microsoft.AspNetCore.Mvc;
    using TALLERVEHICULOS.Models;
    using TALLERVEHICULOS.Data;
    using Microsoft.EntityFrameworkCore;

    namespace TALLERVEHICULOS.Controllers
    {
        public class BrandController : Controller
        {
            private readonly AppDbContext _appDbContext;

            public BrandController(AppDbContext appDbContext)
            {
                _appDbContext = appDbContext;
            }

            [HttpGet]
            public async Task<IActionResult> Lista()
            {
                List<Brand> lista = await _appDbContext.Brands.ToListAsync();
                return View(lista);
            }

            [HttpGet]
            public IActionResult Nuevo()
            {
                return View();
            }

            [HttpPost]
            public async Task<IActionResult> Nuevo(Brand brand)
            {
                await _appDbContext.Brands.AddAsync(brand);
                await _appDbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Lista));
            }
            [HttpGet]
            public async Task<IActionResult> Editar(int id)
            {
                Brand Brand = await _appDbContext.Brands.FirstAsync(e => e.Id == id);
                return View(Brand);

            }

            [HttpPost]
            public async Task<IActionResult> Editar(Brand brand)
            {
                _appDbContext.Brands.Update(brand);
                await _appDbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Lista));

            }

            [HttpGet]
            public async Task<IActionResult> Eliminar(int id)
            {
                Brand Brand = await _appDbContext.Brands.FirstAsync(e => e.Id == id);
                _appDbContext.Brands.Remove(Brand);
                await _appDbContext.SaveChangesAsync();
                return RedirectToAction(nameof(Lista));


            }




        }
    }
