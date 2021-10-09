using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CalidadT2.Constantes;
using CalidadT2.Models;
using CalidadT2.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CalidadT2.Controllers
{
    [Authorize]
    public class BibliotecaController : Controller
    {
        private readonly IUserRepository repositoryU;
        private readonly IBibliotecaRepository repositoryB;
        public BibliotecaController(IUserRepository repositoryU, IBibliotecaRepository repositoryB)
        {
            this.repositoryU = repositoryU;
            this.repositoryB = repositoryB;
        }

        [HttpGet]
        public IActionResult Index()
        {
            repositoryU.SetHttpContext(HttpContext);
            Usuario user = repositoryU.LoggedUser();
            var model = repositoryB.BibliotecaDelUsuario(user);

            return View(model);
        }

        [HttpGet]
        public ActionResult Add(int libro)
        {
            repositoryU.SetHttpContext(HttpContext);
            Usuario user = repositoryU.LoggedUser();

            var biblioteca = new Biblioteca
            {
                LibroId = libro,
                UsuarioId = user.Id,
                Estado = ESTADO.POR_LEER
            };
            repositoryB.SetTempDataService(TempData);
            repositoryB.AddBiblioteca(biblioteca);

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult MarcarComoLeyendo(int libroId)
        {
            repositoryU.SetHttpContext(HttpContext);
            Usuario user = repositoryU.LoggedUser();
            repositoryB.SetTempDataService(TempData);
            repositoryB.MarcarLibroComoLeyendo(libroId,user);

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult MarcarComoTerminado(int libroId)
        {
            repositoryU.SetHttpContext(HttpContext);
            Usuario user = repositoryU.LoggedUser();
            repositoryB.SetTempDataService(TempData);
            repositoryB.MarcarLibroComoTerminado(libroId, user);

            return RedirectToAction("Index");
        }
    }
}
