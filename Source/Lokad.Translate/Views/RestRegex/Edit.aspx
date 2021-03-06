<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Lokad.Translate.Entities.RestRegex>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit Regex - Lokad.Translate
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit Regex</h2>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Name">Name:</label>
                <%= Html.TextBox("Name", Model.Name) %>
                <%= Html.ValidationMessage("Name", "*") %>
            </p>
            <p>
				<%= Html.RadioButton("RegexType", "code", Model.IsCode, new { id = "code" }) %>
                <label for="code" class="inline">Is Code</label>
                <%= Html.ValidationMessage("IsCode", "*") %>
            </p>
            <p>
				<%= Html.RadioButton("RegexType", "edit", Model.IsEdit, new { id = "edit" }) %>
                <label for="edit" class="inline">Is Edit</label>
                <%= Html.ValidationMessage("IsEdit", "*") %>
            </p>
            <p>
                <%= Html.RadioButton("RegexType", "history", Model.IsHistory, new { id = "history" })%>
                <label for="history" class="inline">Is History</label>
                <%= Html.ValidationMessage("IsHistory", "*") %>
            </p>
            <p>
                <%= Html.RadioButton("RegexType", "diff", Model.IsDiff, new { id = "diff" })%>
                <label for="diff" class="inline">Is Diff</label>
                <%= Html.ValidationMessage("IsDiff", "*") %>
            </p>
            <p>
                <label for="MatchRegex">Match Regex:</label>
                <%= Html.TextBox("MatchRegex", Model.MatchRegex) %>
                <%= Html.ValidationMessage("MatchRegex", "*") %>
            </p>
            <p>
                <label for="ReplaceRegex">Replace Regex:</label>
                <%= Html.TextBox("ReplaceRegex", Model.ReplaceRegex) %>
                <%= Html.ValidationMessage("ReplaceRegex", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to Regex", "Index") %>
    </div>

</asp:Content>

