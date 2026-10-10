namespace TiendaApi.Models;

using Microsoft.EntityFrameworkCore;

public class TiendaDbContext : DbContext
{
    public TiendaDbContext(DbContextOptions<TiendaDbContext> options) : base(options)
    {
    }

    public DbSet<Cliente> Clientes { get; set; }
}
