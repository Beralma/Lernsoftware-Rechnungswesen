using System;
using System.Collections.Generic;

namespace Hausarbeit
{
    public partial class Inhalt
    {
        public Inhalt()
        {
            Aufgabenstellungs = new HashSet<Aufgabenstellung>();
        }

        public int InhaltId { get; set; }
        public int KapitelId { get; set; }
        public string InhaltText { get; set; } = null!;

        public virtual Kapitel Kapitel { get; set; } = null!;
        public virtual ICollection<Aufgabenstellung> Aufgabenstellungs { get; set; }
    }
}
