module Api
  module V1
    class CommitsController < ApiController
      def show
        @commit = find_specific_commit params[:organization_id], params[:repo_id], params[:sha]
      end
    end
  end
end
