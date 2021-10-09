using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace CalidadT2.Services
{
    public interface ICookieAuthService
    {
        public void Login(ClaimsPrincipal claims);
        public void Logout();
        void SetHttpContext(HttpContext httpContext);
    }
    public class CookieAuthService : ICookieAuthService
    {
        private HttpContext httpContext;

        public void Logout()
        {
            httpContext.SignOutAsync();
        }

        public void SetHttpContext(HttpContext httpContext)
        {
            this.httpContext = httpContext;
        }

        void ICookieAuthService.Login(ClaimsPrincipal claims)
        {
            httpContext.SignInAsync(claims);
        }
    }
}
