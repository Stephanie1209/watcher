module Api
  module V1
    class RepositoriesController < ApiController
      def show
        @organization = organization
      end
    end
  end
end
