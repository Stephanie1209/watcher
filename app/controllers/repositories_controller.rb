class RepositoriesController < ApplicationController
  def show
    @repository = GithubRepository.new params[:name]
    @issues = repository_issues
    @pull_requests = repository_pull_requests
    @open_issues_count = count_open_repository_issues
    @closed_issues_count = count_closed_repository_issues
  end

  private

  def repository_issues
    @repository.issues.map { |issue| Issue.new issue }
  end

  def count_open_repository_issues
    @issues.keep_if { |issue| issue.state == "open"}.count
  end

  def count_closed_repository_issues
    @issues.keep_if { |issue| issue.state == "closed"}.count
  end

  def repository_pull_requests
    @repository.pull_requests.map { |pr| PullRequest.new pr }
  end
end

