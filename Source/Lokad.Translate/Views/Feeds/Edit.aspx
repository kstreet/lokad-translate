<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Lokad.Translate.Entities.Feed>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit Feed
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit Feed</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Id">Id:</label>
                <%= Html.TextBox("Id", Model.Id, new { disabled = "true" })%>
                <%= Html.ValidationMessage("Id", "*") %>
            </p>
            <p>
                <label for="Created">Created:</label>
                <%= Html.TextBox("Created", String.Format("{0:g}", Model.Created), new { disabled = "true" })%>
                <%= Html.ValidationMessage("Created", "*") %>
            </p>
            <p>
                <label for="Name">Name:</label>
                <%= Html.TextBox("Name", Model.Name) %>
                <%= Html.ValidationMessage("Name", "*") %>
            </p>
            <p>
                <label for="Url">Url:</label>
                <%= Html.TextBox("Url", Model.Url, new {@class = "editbox", size = 100}) %>
                <%= Html.ValidationMessage("Url", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

