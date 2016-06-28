module Api
  module V1
    class OrganizationsController < ApiController
      def show
        binding.pry
        @organization = organization
      end
    end
  end
end
