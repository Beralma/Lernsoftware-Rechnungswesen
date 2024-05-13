using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hausarbeit
{
    public class MyDataContext
    {
        public static string mycultureinfo { get; private set; } = "de-DE";
        public MyDataContext()
        {
            
        }
        public static void switchCulture(string Name)
        {
            mycultureinfo = Name;
        }
    }
}
