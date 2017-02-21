﻿<%@ Page Title="Profile" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ProgrammersSpot.WebClient.Account.Profile" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:LoginView runat="server" ID="LoginView">
          <RoleGroups>
            <asp:RoleGroup Roles="User">
                <ContentTemplate>
                    <div class="regular-user-profile" >
                    <h2>
                    <%: this.Model.FoundRegularUser.FirstName + " " + 
                            this.Model.FoundRegularUser.LastName + "'s Profile" %>
                    </h2>
        
                    <ul id="profile" class="profile">
                        <li>
                            <div class="col col_4 profile-pic">
                                <asp:Image runat="server" CssClass="img-responsive avatar" ImageUrl="<%# this.Model.ProfileImage %>" />
                                <div class="info">
                                    <%--<small><i class="fa fa-map-marker"></i> Bulgaria (Sofia)</small>--%>
                                    <p><i class="fa fa-briefcase"></i> <%: this.Model.FoundRegularUser.JobTitle %>  </p>
                                    <asp:LinkButton runat="server" ID="Edit" Text="<i class='fa fa-pencil'></i> Edit Profile" 
                                          OnClick="Edit_Click" CssClass="btn-o" />
                                    <div class="social-profiles">
                                        <a href="<%: this.Model.FoundRegularUser.FacebookProfile %>" class="fa fa-facebook"></a>
                                        <a href="<%: this.Model.FoundRegularUser.GitHubProfile %>" class="fa fa-github"></a>
                                    </div>
                                </div>
                            </div>       
                        </li>
		                <li class="default open">
			                <div class="link"><i class="fa fa-globe"></i>About</div>
			                <ul class="submenu">
				                <li>Age : <%: this.Model.FoundRegularUser.Age==0 ? "" : this.Model.FoundRegularUser.Age.ToString() %></li>
				                <li>Email : <%: this.Model.FoundRegularUser.Email %></li>
			                </ul>
		                </li>
		                <li class="default open">
			                <div class="link"><i class="fa fa-code"></i>Professional Skills</div>
			                <ul class="submenu">
				                <li>
                                    <asp:Repeater  runat="server" ID="Skills">
                                        <ItemTemplate>
                                            <span class="skill"><%# Eval("Name") %></span>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </li>
		                    </ul>
                        </li>
                        <li class="default open">
			                <div class="link"><i class="fa fa-file-code-o"></i>Projects</div>
			                <ul class="submenu">
				                <li>
                                    <asp:Repeater  runat="server" ID="Projects">
                                        <ItemTemplate>
                                            <a class="skill" href="<%# Eval("LinkToProject") %>"><%# Eval("Name") %></a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </li>
		                    </ul>
                        </li>
                    </ul>
                </div>  
                </ContentTemplate>
            </asp:RoleGroup>

            <asp:RoleGroup Roles="Firm">
                <ContentTemplate>
                    <div class="regular-user-profile" >
                    <h2>
                    <%: this.Model.FoundFirmUser.FirmName + "'s Profile" %>
                    </h2>
        
                    <ul id="profile" class="profile">
                        <li>
                            <div class="col col_4 profile-pic">
                                <asp:Image runat="server" CssClass="img-responsive avatar" ImageUrl="<%# this.Model.ProfileImage %>" />
                                <div class="info">
                                    <p><i class="fa fa-map-marker"></i> <%: this.Model.FoundFirmUser.Country.Name %> (<%: this.Model.FoundFirmUser.City.Name %>) </p>
                                    <asp:LinkButton runat="server" ID="Edit" Text="<i class='fa fa-pencil'></i> Edit Profile" 
                                          OnClick="Edit_Click" CssClass="btn-o" />
                                    <div class="social-profiles firm">
                                        <a href="<%: this.Model.FoundFirmUser.Website %>" class="fa fa-globe"></a>
                                    </div>
                                </div>
                            </div>       
                        </li>
		                <li class="default open">
			                <div class="link"><i class="fa fa-globe"></i>About</div>
			                <ul class="submenu">
				                <li>Adress : <%: this.Model.FoundFirmUser.Address %></li>
				                <li>Employees : <%: this.Model.FoundFirmUser.EmployeesCount %></li>
			                </ul>
		                </li>
		             
                        <li class="default open">
			                <div class="link"><i class="fa fa-file-code-o"></i>Reviews</div>
			                <ul class="submenu">
				                <li>
                                    <asp:Repeater  runat="server" ID="Reviews">
                                        <ItemTemplate>
                                            <a class="skill"><%# Eval("Content") %></a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </li>
		                    </ul>
                        </li>
                    </ul>
                </div>  
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
        
    </asp:LoginView>
</asp:Content>
