module Api
  module V1
    class ReposController < ApiController
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

      def all_pull_requests
        search_for_specific_repository
        @pull_requests = @repository.pull_requests.map { |pr| PullRequest.new pr }
      end

      def open_pull_requests
        search_for_specific_repository
        @open_pull_requests = @repository.open_pull_requests.map { |pr| PullRequest.new pr }
      end

      def closed_pull_requests
        search_for_specific_repository
        @closed_pull_requests = @repository.closed_pull_requests.map { |pr| PullRequest.new pr }
      end

      def branches
        @organization = find_github_organization(params[:id])
        branches_data = @client.branches("#{params[:organization_id]}/#{params[:repository_id]}")
        @branches = branches_data.map { |data| Branch.new data }
      end

      private

      def search_for_specific_repository
        @organization = find_github_organization(params[:organization_id])
        repo = @client.repository("#{params[:organization_id]}/#{params[:repository_id]}")
        issues = @client.list_issues("#{params[:organization_id]}/#{params[:repository_id]}", issues_query_options)
        @repository = Repository.new(repo, issues)
      end

      def issues_query_options
        {filter: "all", state: "all"}
      end
    end
  end
end
