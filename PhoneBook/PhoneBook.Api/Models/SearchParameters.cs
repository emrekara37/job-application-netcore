using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PhoneBook.Api.Models
{
    public class SearchParameters
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public string Text { get; set; }

    }
}
