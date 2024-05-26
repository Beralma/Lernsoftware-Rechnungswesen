using System;
using System.Collections.Generic;

namespace Hausarbeit
{
    public partial class Aufgabenstellung
    {
        public Aufgabenstellung()
        {
            Rueckmeldungs = new HashSet<Rueckmeldung>();
        }

        public int AgsId { get; set; }
        public int InhaltId { get; set; }
        public string AgsText { get; set; } = null!;

        public virtual Inhalt Inhalt { get; set; } = null!;
        public virtual ICollection<Rueckmeldung> Rueckmeldungs { get; set; }
    }
}
