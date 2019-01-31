using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using PhoneBook.Api.Models;
using PhoneBook.Api.Repositories.Contacts;

namespace PhoneBook.Api.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    [EnableCors("AllAllow")]
    public class ContactsController : ControllerBase
    {
        private readonly IContactRepository _contactRepository;

        public ContactsController(IContactRepository contactRepository)
        {
            _contactRepository = contactRepository;
        }

        [HttpGet]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [HttpGet]
        public async Task<Contact> Get(int id)
        {
            var contact = await _contactRepository.GetById(id);
            return contact;
        }

        [HttpDelete]
        public async Task Delete(int id)
        {
            await _contactRepository.DeleteById(id);
        }

        [HttpPost]
        public async Task<Contact> Update(Contact contact)
        {
            var updatedContact = await _contactRepository.Update(contact);
            return updatedContact;
        }

        [HttpPost]
        public async Task<IActionResult> Insert(Contact contact)
        {
            var entity = await _contactRepository.Insert(contact);
            return Ok(entity.Id > 0);
        }

        [HttpPost]
        public async Task<object> Search(SearchParameters parameters)
        {
            if (string.IsNullOrEmpty(parameters.Text))
            {
                parameters.Text = string.Empty;
            }

            var search = await _contactRepository.Search(parameters);
            return search;
        }
    }
}