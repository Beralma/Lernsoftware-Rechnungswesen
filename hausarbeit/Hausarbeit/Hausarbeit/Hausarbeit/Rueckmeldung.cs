using System;
using System.Collections.Generic;

namespace Hausarbeit
{
    public partial class Rueckmeldung
    {
        public int RueckId { get; set; }
        public string RueckText { get; set; } = null!;
        public int? AgsId { get; set; }

        public virtual Aufgabenstellung? Ags { get; set; }
    }
}
