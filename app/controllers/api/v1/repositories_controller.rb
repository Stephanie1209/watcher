module Api
  module V1
    class RepositoriesController < ApiController
      def show
        @organization = organization params[:id]
      end

      def list
        @repositories = repositories params[:id]
      end
    end
  end
end
