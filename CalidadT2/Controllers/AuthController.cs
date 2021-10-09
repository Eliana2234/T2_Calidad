using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using CalidadT2.Models;
using CalidadT2.Repositories;
using CalidadT2.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;

namespace CalidadT2.Controllers
{
    public class AuthController : Controller
    {
        private readonly IUserRepository repository;
        private readonly ICookieAuthService cookieAuthService;

        public AuthController(IUserRepository repository, ICookieAuthService cookieAuthService)
        {
            this.repository = repository;
            this.cookieAuthService = cookieAuthService;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(string username, string password)
        {
            var usuario = repository.BuscarUsuarioPorUsernameYPassword(username, password);
            if (usuario != null)
            {
                var claims = new List<Claim> {
                    new Claim(ClaimTypes.Name, username)
                };

                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);

                cookieAuthService.SetHttpContext(HttpContext);
                cookieAuthService.Login(claimsPrincipal);

                return RedirectToAction("Index", "Home");
            }
            
            ViewBag.Validation = "Usuario y/o contraseña incorrecta";
            return View();
        }

        public ActionResult Logout()
        {
            cookieAuthService.SetHttpContext(HttpContext);
            cookieAuthService.Logout();
            return RedirectToAction("Login");
        }
    }
}
