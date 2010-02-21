﻿#region Copyright (c) Lokad 2009 - 2010
// This code is released under the terms of the new BSD licence.
// URL: http://www.lokad.com/
#endregion

using System.Linq;
using System.Net;
using System.Threading;
using Lokad.Translate.BusinessLogic;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace Lokad.Translate.Worker
{
	public class WorkerRole : RoleEntryPoint
	{
		public override void Run()
		{
			// update all feeds and pages accordingly
			while (true)
			{
				using(var inner = GlobalSetup.Container.CreateInnerContainer())
				{
					var feedProc = inner.Resolve<FeedProcessor>();
					feedProc.ProcessAll();

					var pageProc = inner.Resolve<PageProcessor>();
					pageProc.ProcessAll();
				}

				Thread.Sleep(600 * 1000); // 10min sleep (just a magic constant for now)
			}
		}

		public override bool OnStart()
		{
			// Set the maximum number of concurrent connections 
			ServicePointManager.DefaultConnectionLimit = 12;

			//DiagnosticMonitor.Start("DiagnosticsConnectionString");

			// For information on handling configuration changes
			// see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.
			RoleEnvironment.Changing += RoleEnvironmentChanging;

			return base.OnStart();
		}

		private void RoleEnvironmentChanging(object sender, RoleEnvironmentChangingEventArgs e)
		{
			// If a configuration setting is changing
			if (e.Changes.Any(change => change is RoleEnvironmentConfigurationSettingChange))
			{
				// Set e.Cancel to true to restart this role instance
				e.Cancel = true;
			}
		}
	}
}
