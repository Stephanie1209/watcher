module Api
  module V1
    class CommitsController < ApiController
      def show
        @commit = find_specific_commit params[:sha]
      end

      def index
        if params[:since] && params[:until]
          @commits = find_all_commits_between params[:since], params[:until]
        else
          @commits = find_all_commits
        end
      end
    end
  end
end
