module Api
  module V1
    class OrganizationsController < ApiController

      def show
        @organization = find_github_organization(params[:id])
      end

      def repositories_info
        @organization = find_github_organization(params[:id])
      end

    end
  end
end
