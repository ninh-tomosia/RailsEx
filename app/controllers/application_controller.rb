class ApplicationController < ActionController::Base
    add_flash_types :notice, :error, :warning, :danger, :success
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :running

    protected

    def running
        if logged_in? == false
            redirect_to login_path
        end
    end
end