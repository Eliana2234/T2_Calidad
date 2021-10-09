using CalidadT2.Controllers;
using CalidadT2.Models;
using CalidadT2.Repositories;
using CalidadT2.Services;
using Microsoft.AspNetCore.Mvc;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;

namespace TestT2Calidad
{
    class LibroControllerTest
    {
        [Test]
        public void VistaLibros()
        {

            var repository = new Mock<ILibroRepository>();
            repository.Setup(o => o.LibroConAutorYComentarios(It.IsAny<int>())).Returns(new Libro());


            var repositoryU = new Mock<IUserRepository>();

            var authMock = new Mock<ICookieAuthService>();

            var controller = new LibroController(repositoryU.Object, repository.Object);

            var view = controller.Details(It.IsAny<int>());

            Assert.IsInstanceOf<ViewResult>(view);
        }

        [Test]
        public void AddComentarioCorrectamente()
        {

            var repository = new Mock<ILibroRepository>();
            repository.Setup(o => o.LibroComentarios(It.IsAny<Comentario>())).Returns(new Libro());

            var repositoryU = new Mock<IUserRepository>();
            repositoryU.Setup(o => o.LoggedUser()).Returns(new Usuario());


            var controller = new LibroController(repositoryU.Object, repository.Object);

            var view = controller.AddComentario(new Comentario());

            Assert.IsInstanceOf<RedirectToActionResult>(view);
        }
    }
}
