using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Microsoft.AspNetCore.Connections;
using Microsoft.AspNetCore.Mvc;
using PhoneBook.Api.Models;
using Microsoft.Extensions.Configuration;

namespace PhoneBook.Api.Repositories.Contacts
{
    public class ContactRepository : IContactRepository
    {
        private readonly IConfiguration _config;

        public ContactRepository(IConfiguration config)
        {
            _config = config;
        }

        public IDbConnection Connection => new SqlConnection(_config.GetConnectionString("PhoneBook"));


        public async Task<List<Contact>> GetAllContact()
        {
            using (var conn = Connection)
            {
                conn.Open();

                const string query = "Select * from Contacts order by CreatedTime desc";
                var result = await conn.QueryAsync<Contact>(query);
                conn.Close();
                return result.ToList();
            }
        }

        public async Task<Contact> GetById(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                const string query = "Select * from Contacts where Id= @Id";
                var result = await conn.QueryAsync<Contact>(query, new { Id = id });
                return result.FirstOrDefault();
            }
        }

        public async Task DeleteById(int id)
        {
            using (var conn = Connection)
            {
                conn.Open();
                const string query = "Delete from Contacts where Id= @Id";
                await conn.ExecuteAsync(query, new { Id = id });
                conn.Close();
            }
        }

        public async Task<int> GetPageCount(SearchParameters parameters)
        {
            using (var conn = Connection)
            {
                conn.Open();
                const string query =@" 
                    select 1 +(count(Id) /@PageSize) from Contacts  where 
                    FirstName like @firstName or 
                    LastName like @lastName or
                    PhoneNumber like @phoneNumber";
                var result = await conn.QueryAsync<int>(query,
                    new { parameters.PageSize, firstName = parameters.Text, lastName = parameters.Text, phoneNumber = parameters.Text });
                var list = result.FirstOrDefault();
                return list;
            }
        }


        public async Task<Contact> Insert(Contact contact)
        {
            using (var conn = Connection)
            {
                contact.CreatedTime = DateTime.Now;
                conn.Open();
                const string query = "Insert into Contacts(FirstName,LastName,PhoneNumber,CreatedTime) output inserted.[Id] Values(@FirstName,@LastName,@PhoneNumber,@CreatedTime);";
                var id = await conn.QueryAsync<int>(query, contact);
                contact.Id = id.FirstOrDefault();
                conn.Close();
                return contact;
            }
        }

        public async Task<Contact> Update(Contact contact)
        {
            var entity = await GetById(contact.Id);
            if (entity == null) return contact;
            using (var conn = Connection)
            {
                conn.Open();
                const string query = "Update Contacts set FirstName=@FirstName , LastName=@LastName, PhoneNumber=@PhoneNumber where Id=@Id";
                await conn.ExecuteAsync(query, new { contact.FirstName, contact.LastName, contact.PhoneNumber, contact.Id });
                conn.Close();

            }
            return contact;
        }

        public async Task<object> Search(SearchParameters parameters)
        {

            using (var conn = Connection)
            {
                conn.Open();

                const string query = @"
                    select * from Contacts	
                    WHERE 
                    FirstName like @firstName or 
                    LastName like @lastName or
                    PhoneNumber like @phoneNumber
                    order by CreatedTime desc
                    OFFSET @PageNumber *@PageSize ROWS
                    FETCH NEXT @PageSize ROWS ONLY";
                parameters.Text = $"%{parameters.Text}%";
                var result = await conn.QueryAsync<Contact>(query,new { firstName = parameters.Text, lastName = parameters.Text, phoneNumber = parameters.Text, parameters.PageNumber, parameters.PageSize });
                var list = result.ToList();
                var pageCount = await GetPageCount(parameters);
                return new { Contacts = list, PageCount = pageCount };
            }
        }
    }

}
