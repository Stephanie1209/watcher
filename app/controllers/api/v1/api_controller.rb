  module Api
  module V1
    class ApiController < ApplicationController
      before_action :client

      def organization id
        Organization.new id
      end

      def repositories id
        @repositories = []
        repository_list = client.org_repos(id)
        repository_list.each do |repository|
          @repositories << Repository.new(repository)
        end
        @repositories
      end

      def issues
        @issues = []
        issues_list = client.list_issues
        issues_list.each do |issue|
          @issues << Issue.new(issue)
        end
        @issues
      end

      private

      def client
        GithubData.new.client
      end
    end
  end
end
