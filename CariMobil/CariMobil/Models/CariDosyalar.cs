//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CariMobil.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CariDosyalar
    {
        public int CariDosyalarID { get; set; }
        public Nullable<int> cariId { get; set; }
        public string path { get; set; }
        public Nullable<System.DateTime> yuklenmeTarihi { get; set; }
        public Nullable<bool> sil { get; set; }
    }
}
