class Guest::HomeController < ApplicationController
    skip_before_action :running
    
    def index
    end
end