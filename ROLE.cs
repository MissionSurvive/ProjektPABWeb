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
    
    public partial class ROLE
    {
        public ROLE()
        {
            this.KONTA_KLIENTOW = new HashSet<KONTA_KLIENTOW>();
            this.KONTA_PRACOWNIKOW = new HashSet<KONTA_PRACOWNIKOW>();
        }
    
        public decimal ID_ROLA { get; set; }
        public string ROLA { get; set; }
    
        public virtual ICollection<KONTA_KLIENTOW> KONTA_KLIENTOW { get; set; }
        public virtual ICollection<KONTA_PRACOWNIKOW> KONTA_PRACOWNIKOW { get; set; }
    }
}
