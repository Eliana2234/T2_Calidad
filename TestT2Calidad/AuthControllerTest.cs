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
    class AuthControllerTest
    {
        [Test]
        public void LoginCorrecto()
        {

            var repository = new Mock<IUserRepository>();
            repository.Setup(o => o.BuscarUsuarioPorUsernameYPassword(It.IsAny<String>(), It.IsAny<String>())).Returns(new Usuario());

            var authMock = new Mock<ICookieAuthService>();

            var controller = new AuthController(repository.Object, authMock.Object);

            var view = controller.Login("admin", "admin");

            Assert.IsInstanceOf<RedirectToActionResult>(view);
        }

        [Test]
        public void LoginIncorrecto()
        {
            var repository = new Mock<IUserRepository>();
            repository.Setup(o => o.BuscarUsuarioPorUsernameYPassword(It.IsAny<String>(), It.IsAny<String>())).Returns(new Usuario());

            var authMock = new Mock<ICookieAuthService>();

            var controller = new AuthController(repository.Object, authMock.Object);

            var view = controller.Login();

            Assert.IsInstanceOf<ViewResult>(view);
        }


        [Test]
        public void Logout()
        {

            var repository = new Mock<IUserRepository>();

            var authMock = new Mock<ICookieAuthService>();

            var controller = new AuthController(repository.Object, authMock.Object);

            var view = controller.Logout();

            Assert.IsInstanceOf<RedirectToActionResult>(view);
        }
    }
}
