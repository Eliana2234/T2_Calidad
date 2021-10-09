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
    class HomeControllerTest
    {
        [Test]
        public void VistaLibros()
        {

            var repository = new Mock<ILibroRepository>();
            repository.Setup(o => o.ListaLibros()).Returns(new List<Libro>());

            var controller = new HomeController(repository.Object);

            var view = controller.Index();

            Assert.IsInstanceOf<ViewResult>(view);
        }
    }
}
