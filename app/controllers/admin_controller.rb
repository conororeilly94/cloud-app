class AdminController < ApplicationController
    before_action :can_access?

    def accounts
        @accounts = Account.where(administrator: false)
    end

    def can_access?
        @show_sidebar = true 

        unless current_account.administrator?
            redirect_to root_url, flash: { danger: "You do not have access to view this page" }
        end
    end
end
