module Api
  module V1
    class ApiController < ApplicationController
      before_action :retrieve_data_from_github

      def organization id
        Organization.new(@github_organization.find(id))
      end

      def repositories id
        @repositories = []
        repository_list = @github_organization.find_respositories(id)
        repository_list.each do |repository|
          @repositories << Repository.new(repository)
        end
        @repositories
      end

      def retrieve_data_from_github
        @github_organization = GithubOrganization.new
      end
    end
  end
end
