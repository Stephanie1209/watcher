class RepositoriesController < ApplicationController
  
  def show
    @repository = GithubRepository.new params[:name] 
    @issues = repository_issues 
    @pull_requests = repository_pull_requests
  end

  private

  def repository_issues
    @repository.issues.map { |issue| Issue.new issue }
  end

  def repository_pull_requests
    @repository.pull_requests.map { |pr| PullRequest.new pr }
  end
end
