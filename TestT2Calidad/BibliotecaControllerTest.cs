using CalidadT2.Controllers;
using CalidadT2.Models;
using CalidadT2.Repositories;
using Microsoft.AspNetCore.Mvc;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;

namespace TestT2Calidad
{
    class BibliotecaControllerTest
    {
        [Test]
        public void MostrarBibliotecaDelUsuarioLoggeado()
        {

            var repositoryU = new Mock<IUserRepository>();
            repositoryU.Setup(o => o.LoggedUser()).Returns(new Usuario());

            var repositoryB = new Mock<IBibliotecaRepository>();

            var controller = new BibliotecaController(repositoryU.Object, repositoryB.Object);

            var view = controller.Index();

            Assert.IsInstanceOf<ViewResult>(view);
        }

        [Test]
        public void AgregarUnLibroALaBibliotecaDelUsuario()
        {

            var repositoryU = new Mock<IUserRepository>();
            repositoryU.Setup(o => o.LoggedUser()).Returns(new Usuario());

            var repositoryL = new Mock<ILibroRepository>();

            var repositoryB = new Mock<IBibliotecaRepository>();

            var controller = new BibliotecaController(repositoryU.Object, repositoryB.Object);

            var view = controller.Add(It.IsAny<int>());

            Assert.IsInstanceOf<RedirectToActionResult>(view);
        }

        [Test]
        public void MarcarLibroComoLeyendo()
        {

            var repositoryU = new Mock<IUserRepository>();
            repositoryU.Setup(o => o.LoggedUser()).Returns(new Usuario());

            var repositoryB = new Mock<IBibliotecaRepository>();

            var controller = new BibliotecaController(repositoryU.Object, repositoryB.Object);

            var view = controller.MarcarComoLeyendo(It.IsAny<int>());

            Assert.IsInstanceOf<RedirectToActionResult>(view);
        }

        [Test]
        public void MarcarLibroComoTerinado()
        {

            var repositoryU = new Mock<IUserRepository>();
            repositoryU.Setup(o => o.LoggedUser()).Returns(new Usuario());

            var repositoryB = new Mock<IBibliotecaRepository>();

            var controller = new BibliotecaController(repositoryU.Object, repositoryB.Object);

            var view = controller.MarcarComoTerminado(It.IsAny<int>());

            Assert.IsInstanceOf<RedirectToActionResult>(view);
        }
    }
}
