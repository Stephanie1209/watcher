module Api
  module V1
    class RepositoriesController < ApiController

      def index
        @organization = find_github_organization(params[:organization_id])
        search_repositories_for_organization
      end

      def all_issues
        search_for_specific_repository
        @issues = @repository.issues.map { |issue| Issue.new issue }
      end

      def open_issues
        search_for_specific_repository
        @open_issues = @repository.open_issues.map { |issue| Issue.new issue }
      end

      def closed_issues
        search_for_specific_repository
        @closed_issues = @repository.closed_issues.map { |issue| Issue.new issue }
      end

      private

      def search_repositories_for_organization
        @repositories = []
        repos = @client.org_repos(params[:organization_id], query_options)
        issues_and_pull_requests = @client.org_issues(params[:organization_id], issues_query_options)
        repos.each do |repo|
          issues = issues_and_pull_requests.select { |ipr| ipr[:repository_url] == repo[:url] }
          @repositories << Repository.new(repo, issues)
        end
      end

      def search_for_specific_repository
        @organization = find_github_organization(params[:organization_id])
        search_repositories_for_organization
        repository = @repositories.select { |repo| params[:repository_id] == repo.name }
        @repository = repository.first
      end

      def issues_query_options
        {filter: "all", state: "all"}
      end
    end
  end
end
