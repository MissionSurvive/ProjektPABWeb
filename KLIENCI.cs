//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CarRentalWeb
{
    using System;
    using System.Collections.Generic;
    
    public partial class KLIENCI
    {
        public KLIENCI()
        {
            this.KONTA_KLIENTOW1 = new HashSet<KONTA_KLIENTOW>();
            this.ZAMOWIENIA = new HashSet<ZAMOWIENIA>();
        }
    
        public decimal ID_KLIENT { get; set; }
        public Nullable<decimal> iD_KON_KLIENT { get; set; }
        public string IMIE_KLIENT { get; set; }
        public string NAZWISKO_KLIENT { get; set; }
        public string PESEL_KLIENT { get; set; }
        public string TELEFON_KLIENT { get; set; }
        public string FAX { get; set; }
        public Nullable<decimal> NIP { get; set; }
    
        public virtual KONTA_KLIENTOW KONTA_KLIENTOW { get; set; }
        public virtual ICollection<KONTA_KLIENTOW> KONTA_KLIENTOW1 { get; set; }
        public virtual ICollection<ZAMOWIENIA> ZAMOWIENIA { get; set; }
    }
}
