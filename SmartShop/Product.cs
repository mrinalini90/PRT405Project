//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace E_Corp
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {

        public int ProductID { get; set; }

        public string SellerID { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength =-1)]
        [Display(Name = "Name")]
        public string ProductName { get; set; }


        [Display(Name = "Description")]
        public string ProductDescription { get; set; }

        [Display(Name = "Quantity")]
        public int Quanlity { get; set; }

        [Display(Name = "Price")]
        [DataType(DataType.Currency)]
        public Nullable<int> Price { get; set; }

        [Required]
        [Display(Name = "Enable")]

        [DefaultValue(true)]
        public bool Enable { get; set; } = true;
    }
}