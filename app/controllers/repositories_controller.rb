class RepositoriesController < ApplicationController
  
  def show
    mapper = Mapper.new
    @repository = mapper.find_repository params[:name]
    info = mapper.issues_and_pull_requests params[:name]
    @issues = info[:issues]
    @pull_requests = info[:pull_requests]
  end
end
