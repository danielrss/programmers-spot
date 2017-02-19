﻿using Bytes2you.Validation;
using ProgrammersSpot.Business.Data.Contracts;
using ProgrammersSpot.Business.Models.Locations;
using ProgrammersSpot.Business.Models.UserRoles;
using ProgrammersSpot.Business.Models.Users;
using ProgrammersSpot.Business.Services.Contracts;
using System.Collections.Generic;

namespace ProgrammersSpot.Business.Services
{
    public class RegistrationService : IRegistrationService
    {
        private readonly IRepository<Role> userRolesRepo;
        private readonly IRepository<RegularUser> usersRepo;
        private readonly IRepository<FirmUser> firmsRepo;
        private readonly IUnitOfWork unitOfWork;

        public RegistrationService(IRepository<Role> userRolesRepo, IRepository<RegularUser> usersRepo,
            IRepository<FirmUser> firmsRepo, IUnitOfWork unitOfWork)
        {
            Guard.WhenArgument(userRolesRepo, "userRolesRepo").IsNull().Throw();
            Guard.WhenArgument(usersRepo, "usersRepo").IsNull().Throw();
            Guard.WhenArgument(firmsRepo, "firmsRepo").IsNull().Throw();
            Guard.WhenArgument(unitOfWork, "unitOfWork").IsNull().Throw();

            this.userRolesRepo = userRolesRepo;
            this.usersRepo = usersRepo;
            this.firmsRepo = firmsRepo;
            this.unitOfWork = unitOfWork;
        }

        public IEnumerable<Role> GetAllUserRoles()
        {
            return this.userRolesRepo.All();        
        }

        public void CreateFirm(string firmId, string firmName, Country country, City city, string address)
        {
            Guard.WhenArgument(firmId, "firmId").IsNullOrEmpty().Throw();
            Guard.WhenArgument(firmName, "firmName").IsNullOrEmpty().Throw();
            Guard.WhenArgument(country, "country").IsNull().Throw();
            Guard.WhenArgument(city, "city").IsNull().Throw();
            Guard.WhenArgument(address, "address").IsNullOrEmpty().Throw();

            using (var uow = this.unitOfWork)
            {
                this.firmsRepo.Add(new FirmUser()
                {
                    Id = firmId,
                    Country = country,
                    FirmName = firmName,
                    City = city,
                    Address = address
                });

                uow.SaveChanges();
            }
        }

        public void CreateRegularUser(string userId, string firstName, string lastName)
        {
            Guard.WhenArgument(userId, "userId").IsNullOrEmpty().Throw();
            Guard.WhenArgument(firstName, "firstName").IsNullOrEmpty().Throw();
            Guard.WhenArgument(lastName, "lastName").IsNullOrEmpty().Throw();

            using (var uow = this.unitOfWork)
            {
                this.usersRepo.Add(new RegularUser()
                {
                    Id = userId,
                    FirstName = firstName,
                    LastName = lastName
                });

                uow.SaveChanges();
            }
        }
    }
}
