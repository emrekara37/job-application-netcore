using System.Collections.Generic;
using System.Threading.Tasks;
using PhoneBook.Api.Models;

namespace PhoneBook.Api.Repositories.Contacts
{
    public interface IContactRepository
    {

        Task<Contact> GetById(int id);
        Task DeleteById(int id);
        Task<int> GetPageCount(SearchParameters parameters);
        Task<Contact> Insert(Contact contact);
        Task<Contact> Update(Contact contact);
        Task<object> Search(SearchParameters parameters);
    }
}