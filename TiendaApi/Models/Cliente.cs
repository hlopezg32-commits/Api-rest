namespace TiendaApi.Models;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

[Table("clientes")]
public class Cliente
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Column("id_cliente")]
    public int IdCliente { get; set; }

    [Column("nit")]
    public string Nit { get; set; }

    [Column("nombre")]
    public string Nombre { get; set; }

    [Column("apellidos")]
    public string Apellidos { get; set; }

    [Column("email")]
    public string Email { get; set; }
}
