using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Wikipages.Models
{
    [Table("Businesses")]
    public class Business
    {
        [Key]
        public int BusinessId { get; set; }
        public string Type { get; set; }
    }
}
