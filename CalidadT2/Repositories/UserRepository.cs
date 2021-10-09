using CalidadT2.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CalidadT2.Repositories
{
    public interface IUserRepository
    {
        public Usuario BuscarUsuarioPorUsernameYPassword(string username, string password);
        public Usuario LoggedUser();
        public void SetHttpContext(HttpContext httpContext);
    }
    public class UserRepository : IUserRepository
    {
        private readonly AppBibliotecaContext context;

        private HttpContext httpContext;

        public UserRepository(AppBibliotecaContext context)
        {
            this.context = context;
        }

        public Usuario BuscarUsuarioPorUsernameYPassword(string username, string password)
        {
            var user = context.Usuarios
            .Where(o => o.Username == username && o.Password == password)
            .FirstOrDefault();
            return user;
        }

        public void SetHttpContext(HttpContext httpContext)
        {
            this.httpContext = httpContext;
        }

        public Usuario LoggedUser()
        {
            var claim = httpContext.User.Claims.FirstOrDefault();
            var user = context.Usuarios.Where(o => o.Username == claim.Value).FirstOrDefault();
            return user;
        }
    }
}
