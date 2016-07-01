module Api
  module V1
    class ApiController < ApplicationController
      before_action :retrieve_data_from_github
      
      def retrieve_data_from_github
        @github_organization = GithubOrganization.new
      end

      def organization(id)
        Organization.new(@github_organization.find(id))
      end

    end
  end
end
