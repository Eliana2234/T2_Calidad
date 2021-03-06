using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using CalidadT2.Models;
using Microsoft.EntityFrameworkCore;
using CalidadT2.Repositories;

namespace CalidadT2.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILibroRepository libroRepository;
        public HomeController(ILibroRepository libroRepository)
        {
            this.libroRepository = libroRepository;
        }

        [HttpGet]
        public IActionResult Index()
        {
            var model = libroRepository.ListaLibros();
            return View(model);
        }
    }
}
