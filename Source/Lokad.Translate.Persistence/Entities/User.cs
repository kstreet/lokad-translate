﻿#region Copyright (c) Lokad 2009 - 2010
// This code is released under the terms of the new BSD licence.
// URL: http://www.lokad.com/
#endregion
using System;

namespace Lokad.Translate.Entities
{
	public class User
	{
		public virtual long Id { get; set; }

		public virtual DateTime Created { get; set; }

		public virtual string OpenId { get; set; }

		public virtual string DisplayName { get; set; }

		/// <summary>Indicates whether the user is managing
		/// translators (or just one of the translator).
		/// </summary>
		public virtual bool IsManager { get; set; }

		/// <summary>Default language code (if any) to
		/// be applied to this user.</summary>
		/// <remarks>The purpose of this value is to speed-up
		/// interactions with translators leading them directly
		/// to their language of interest.</remarks>
		public virtual string Code { get; set; }
	}
}
