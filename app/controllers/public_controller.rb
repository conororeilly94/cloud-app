class PublicController < ApplicationController
  def main
    if account_signed_in?
      path = current_account.administrator? ? accounts_path : dashboard_path
      session[:account_id] = @account_id
      redirect_to dashboard_path, flash: { success: "Successfully signed in. Welcome to Property Scanner" }
    end

    @properties = Property.latest
    @blogposts = Blogpost.latest
  end
end
