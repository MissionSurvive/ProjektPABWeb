//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CarRentalWeb
{
    using System;
    using System.Collections.Generic;
    
    public partial class ZAMOWIENIA
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ZAMOWIENIA()
        {
            this.HISTORIA_ZAMOWIENIA = new HashSet<HISTORIA_ZAMOWIENIA>();
        }
    
        public decimal ID_ZAMOWIENIE { get; set; }
        public Nullable<decimal> ID_PAKIET { get; set; }
        public Nullable<decimal> ID_HISTORIA { get; set; }
        public decimal ID_WYPOZYCZALNIA { get; set; }
        public decimal ID_KLIENT { get; set; }
        public decimal ID_SAMOCHOD { get; set; }
        public decimal LICZBA_DNI { get; set; }
        public decimal CENA_ZAMOWIENIE { get; set; }
        public System.DateTime DATA_START { get; set; }
        public System.DateTime DATA_KONIEC { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HISTORIA_ZAMOWIENIA> HISTORIA_ZAMOWIENIA { get; set; }
        public virtual HISTORIA_ZAMOWIENIA HISTORIA_ZAMOWIENIA1 { get; set; }
        public virtual KLIENCI KLIENCI { get; set; }
        public virtual PAKIETY PAKIETY { get; set; }
        public virtual SAMOCHODY SAMOCHODY { get; set; }
        public virtual WYPOZYCZALNIE WYPOZYCZALNIE { get; set; }
    }
}
