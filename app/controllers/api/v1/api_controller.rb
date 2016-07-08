module Api
  module V1
    class ApiController < ApplicationController
      before_action :client

      def organization id
        Organization.new id
      end

      def repositories id
        @repositories = []
        repos = client.org_repos(id)

        repos.each do |repo|
          @repositories << Repository.new(repo)
          issues = client.repo_issue_events(repo["full_name"], query_options)
          unless issues.nil?
            issues.each do |issue|
              @repositories.last.issues << Issue.new(issue)
            end
          end
        end
        @repositories
      end

      def issues

      end

      private

      def client
        GithubData.new.client
      end

      def query_options
        { query: { per_page: 100, page: 1 } }
      end
    end
  end
end
