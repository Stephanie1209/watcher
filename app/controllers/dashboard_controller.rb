class DashboardController < ApplicationController
  
  def index
    mapper = Mapper.new 
    @organization = mapper.organization
    @repositories = mapper.repositories
  end
end
