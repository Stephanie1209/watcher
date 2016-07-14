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

      private

      def search_for_specific_repository
        @organization = find_github_organization(params[:id])
        repo = @client.repository("#{params[:id]}/#{params[:repository_id]}")
        issues = @client.list_issues("#{params[:id]}/#{params[:repository_id]}", issues_query_options)
        @repository = Repository.new(repo, issues)
      end

      def issues_query_options
        {filter: "all", state: "all"}
      end
    end
  end
end
