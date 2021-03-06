﻿#region Copyright (c) Lokad 2009 - 2010
// This code is released under the terms of the new BSD licence.
// URL: http://www.lokad.com/
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using Lokad.Translate.Entities;
using NHibernate.Criterion;
using NHibernate.Linq;

namespace Lokad.Translate.Repositories
{
	public class UserRepository : BaseRepository, IUserRepository
	{
		public IList<User> List()
		{
			return
				(from u in Session.Linq<User>()
				 select u).ToList();
		}

		public void Create(User user)
		{
			// HACK: should be using database-side value generation?
			user.Created = DateTime.UtcNow;

			using (var trans = Session.BeginTransaction())
			{
				Session.Save(user);
				trans.Commit();
			}
		}

		public User Get(string username)
		{
			return Session.CreateCriteria(typeof(User))
				.Add(Restrictions.Eq("OpenId", username)).List<User>().FirstOrDefault();
		}

		public User Edit(long id)
		{
			return Session.Get<User>(id);
		}

		public void Edit(long id, User user)
		{
			using (var trans = Session.BeginTransaction())
			{
				var dbUser = Session.Get<User>(id);

				dbUser.OpenId = user.OpenId;
				dbUser.DisplayName = user.DisplayName;
				dbUser.Code = user.Code;
				dbUser.IsManager = user.IsManager;

				Session.Update(dbUser);
				trans.Commit();
			}
		}

		public void Delete(long id)
		{
			using (var trans = Session.BeginTransaction())
			{
				var user = Session.Get<User>(id);
				Session.Delete(user);
				trans.Commit();
			}
		}
	}
}
