module Api
  module V1
    class ApiController < ApplicationController
      before_action :id

      def organization id
        Organization.new id
      end

      private
      def id
        @id = params[:id]
      end
    end
  end
end
