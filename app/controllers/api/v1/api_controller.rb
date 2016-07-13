module Api
  module V1
    class ApiController < ApplicationController
      before_action :initialize_github_client

      def find_github_organization organization_id
        organization_data = @client.organization(organization_id)
        Organization.new organization_data
      end

      def find_specific_commit sha
        commit_data = @client.commit(full_name, sha)
        Commit.new(commit_data)
      end

      def find_all_commits
        @commits = []
        commits_data = @client.commits(full_name)
        commits_data.each do |commit|
          @commits << Commit.new(commit)
        end
        @commits
      end

      def find_all_commits_between start_date, end_date
        @commits = []
        commits_data = @client.commits_between(full_name, start_date, end_date)
        commits_data.each do |commit|
          @commits << Commit.new(commit)
        end
        @commits
      end

      private

      def full_name
        "#{params[:organization_id]}/#{params[:repo_id]}"
      end

      def initialize_github_client
        @client = GithubData.new.client
      end

      def query_options
        { query: { per_page: 100, page: 1 } }
      end
    end
  end
end
