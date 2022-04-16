<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="UFCD_9952_TrabalhoModelo_2021_22.Index" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divlogin" runat="server">
        Email:<asp:TextBox TextMode="Email" ID="tbEmail" runat="server"></asp:TextBox><br />
        Password:<asp:TextBox TextMode="Password" ID="tbPassword" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Login" /><br />
        <asp:Label ID="lbErro" runat="server" Text=""></asp:Label>
        <asp:DetailsView OnDataBound="DetailsView1_DataBound" ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlLogin">
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID"></asp:BoundField>
                <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome"></asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                <asp:BoundField DataField="Perfil" HeaderText="Perfil" SortExpression="Perfil"></asp:BoundField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource runat="server" ID="SqlLogin" 
            ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
            SelectCommand="SELECT [ID], [Nome], [Email], [Perfil] FROM [Utilizadores] WHERE (([Email] = @Email) AND ([Password] = HASHBYTES('SHA2_512',@Password)) AND ([Estado] = @Estado))">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbEmail" PropertyName="Text" Name="Email" DbType="AnsiString"></asp:ControlParameter>
                <asp:ControlParameter ControlID="tbPassword" PropertyName="Text" Name="Password" DbType="AnsiString"></asp:ControlParameter>
                <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <asp:Chart runat="server" DataSourceID="SqlGrafico" ID="ctl00">
        <Series>
            <asp:Series Name="Series1" ChartType="Pie" XValueMember="Estado" YValueMembers="contar"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource runat="server" ID="SqlGrafico" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT Estado, count(*) as contar
FROM [Quartos]
GROUP BY Estado"></asp:SqlDataSource>
</asp:Content>
