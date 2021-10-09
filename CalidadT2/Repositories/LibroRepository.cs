using CalidadT2.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CalidadT2.Repositories
{
    public interface ILibroRepository
    {
        public List<Libro> ListaLibros();
        public Libro LibroConAutorYComentarios(int id);
        public void AddComments(Comentario comentario);
        public Libro LibroComentarios(Comentario comentario);
    }
    public class LibroRepository : ILibroRepository
    {
        private readonly AppBibliotecaContext context;
        public LibroRepository(AppBibliotecaContext context)
        {
            this.context = context;
        }
        public List<Libro> ListaLibros()
        {
            var model = context.Libros.Include(o => o.Autor).ToList();
            return model;
        }

        public Libro LibroConAutorYComentarios(int id)
        {
            var model = context.Libros.Include("Autor").Include("Comentarios.Usuario").Where(o => o.Id == id).FirstOrDefault();

            return model;
        }

        public void AddComments(Comentario comentario)
        {
            context.Comentarios.Add(comentario);
            context.SaveChanges();
        }

        public Libro LibroComentarios(Comentario comentario)
        {
            var libro = context.Libros.Where(o => o.Id == comentario.LibroId).FirstOrDefault();
            return libro;
        }
    }
}
