using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace szyfrowanie
{
    public class Firma
    {
        public string nip { get; set; }
        public string nazwa { get; set; }
        public decimal sprzedazNetto { get; set; }
        public decimal naleznoscBrutto { get; set; }
        public decimal zakupyBrutto { get; set; }
        public decimal zobowiazaniaBrutto { get; set; }

    }
}
