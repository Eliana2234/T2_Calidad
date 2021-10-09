using System;
using System.Linq;
using CalidadT2.Models;
using CalidadT2.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CalidadT2.Controllers
{
    public class LibroController : Controller
    {
        private readonly IUserRepository repositoryU;
        private readonly ILibroRepository repositoryL;

        public LibroController(IUserRepository repositoryU, ILibroRepository repositoryL)
        {
            this.repositoryU = repositoryU;
            this.repositoryL = repositoryL;
        }

        [HttpGet]
        public IActionResult Details(int id)
        {
            var model = repositoryL.LibroConAutorYComentarios(id);
            return View(model);
        }

        [HttpPost]
        public IActionResult AddComentario(Comentario comentario)
        {
            repositoryU.SetHttpContext(HttpContext);
            Usuario user = repositoryU.LoggedUser();

            comentario.UsuarioId = user.Id;
            comentario.Fecha = DateTime.Now;

            var libro = repositoryL.LibroComentarios(comentario);
            libro.Puntaje = (libro.Puntaje + comentario.Puntaje) / 2;
            repositoryL.AddComments(comentario);

            return RedirectToAction("Details", new { id = comentario.LibroId });
        }
    }
}
