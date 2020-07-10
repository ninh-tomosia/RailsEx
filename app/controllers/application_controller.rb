class ApplicationController < ActionController::Base
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