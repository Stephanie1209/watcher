module Api
  module V1
    class OrganizationsController < ApiController
      def show
        @organization = organization(params[:id])
      end
    end
  end
end
