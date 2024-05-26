using System;
using System.Collections.Generic;

namespace Hausarbeit
{
    public partial class Kapitel
    {
        public Kapitel()
        {
            Inhalts = new HashSet<Inhalt>();
        }

        public int KapitelId { get; set; }
        public string KapitelName { get; set; } = null!;

        public virtual ICollection<Inhalt> Inhalts { get; set; }
    }
}
