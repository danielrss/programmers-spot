﻿using Microsoft.AspNet.Identity;
using ProgrammersSpot.Business.MVP.Args;
using ProgrammersSpot.Business.MVP.Presenters;
using ProgrammersSpot.Business.MVP.ViewModels;
using ProgrammersSpot.Business.MVP.Views;
using System;
using WebFormsMvp;
using WebFormsMvp.Web;

namespace ProgrammersSpot.WebClient.TakeABreak
{
    [PresenterBinding(typeof(UserUploadImagePresenter))]
    public partial class UserUploadImage : MvpPage<UploadImageViewModel>, IUserUploadImageView
    {
        public event EventHandler<UserUploadImageEventArgs> UploadImageWithUrl;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            var args = new UserUploadImageEventArgs()
            {
                ImgTitle = this.ImageTitle.Value,
                ImgUrl = this.ImageUrl.Value,
                UploaderId = this.User.Identity.GetUserId()
            };
            this.UploadImageWithUrl?.Invoke(sender, args);

            if (!this.Model.Succeeded)
            {
                this.ErrorMessage.Text = "Unfortunately, the uploading of your image has failed." + Environment.NewLine + "Please, try again later.";
            }
            else
            {
                this.Response.Redirect("~/TakeABreak");
            }
        }
    }
}