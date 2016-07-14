module Api
  module V1
    class ApiController < ApplicationController
      before_action :initialize_github_client

      def find_github_organization organization_id
        organization_data = @client.organization(organization_id)
        Organization.new organization_data
      end

      private

      def full_name
        "#{params[:organization_id]}/#{repo_id_selector}"
      end

      def repo_id_selector
        params[:repo_id] || params[:id]
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
