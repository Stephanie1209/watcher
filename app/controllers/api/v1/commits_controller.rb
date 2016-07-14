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

      private
      def find_all_commits
        @commits = []
        commits_data = @client.commits(full_name)
        commits_data.each do |commit|
          @commits << Commit.new(commit)
        end
      end

      def find_all_commits_between start_date, end_date
        @commits = []
        commits_data = @client.commits_between(full_name, start_date, end_date)
        commits_data.each do |commit|
          @commits << Commit.new(commit)
        end
      end
    end
  end
end
