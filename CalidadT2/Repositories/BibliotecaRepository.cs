using CalidadT2.Constantes;
using CalidadT2.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CalidadT2.Repositories
{
    public interface IBibliotecaRepository
    {
        public List<Biblioteca> BibliotecaDelUsuario(Usuario user);
        public void AddBiblioteca(Biblioteca biblioteca);
        public void MarcarLibroComoLeyendo(int libroId, Usuario user);
        public void MarcarLibroComoTerminado(int libroId, Usuario user);
    }
    public class BibliotecaRepository : IBibliotecaRepository
    {
        private readonly AppBibliotecaContext context;


        public BibliotecaRepository(AppBibliotecaContext context)
        {
            this.context = context;
        }

        public List<Biblioteca> BibliotecaDelUsuario(Usuario user)
        {
            var model = context.Bibliotecas.Include(o => o.Libro.Autor).Include(o => o.Usuario).Where(o => o.UsuarioId == user.Id).ToList();
            return model;
        }

        public void AddBiblioteca(Biblioteca biblioteca)
        {
            context.Add(biblioteca);
            context.SaveChanges();
}

        public void MarcarLibroComoLeyendo(int libroId, Usuario user)
        {
            var libro = context.Bibliotecas
                .Where(o => o.LibroId == libroId && o.UsuarioId == user.Id)
                .FirstOrDefault();

            libro.Estado = ESTADO.LEYENDO;
            context.SaveChanges();
        }

        public void MarcarLibroComoTerminado(int libroId, Usuario user)
        {
            var libro = context.Bibliotecas
                .Where(o => o.LibroId == libroId && o.UsuarioId == user.Id)
                .FirstOrDefault();

            libro.Estado = ESTADO.TERMINADO;
            context.SaveChanges();
        }
    }
}
