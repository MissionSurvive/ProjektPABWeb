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
    
    public partial class MODELE
    {
        public MODELE()
        {
            this.SAMOCHODY = new HashSet<SAMOCHODY>();
        }
    
        public decimal ID_MODEL { get; set; }
        public decimal ID_MARKA { get; set; }
        public decimal ID_NADWOZIE { get; set; }
        public string NAZWA_MODEL { get; set; }
        public decimal ROCZNIK { get; set; }
        public Nullable<decimal> GENERACJA { get; set; }
        public string SEGMENT { get; set; }
    
        public virtual MARKI MARKI { get; set; }
        public virtual RODZAJE_NADWOZIA RODZAJE_NADWOZIA { get; set; }
        public virtual ICollection<SAMOCHODY> SAMOCHODY { get; set; }
    }
}
