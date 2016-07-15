module Api
  module V1
    class CommitsController < ApiController
      def show
        find_specific_commit params[:sha]
      end

      def index
        if params[:since] && params[:until]
          find_all_commits_between
        else
          find_all_commits
        end
      end

      private

      def obtain_branch_commits
        result  = []
        if params[:since] && params[:until]
          commits_in_branch = @client.commits_between(full_name, params[:since],
                                                params[:until], params[:branch])
          @client.commits_between(full_name, params[:since], params[:until]).each { |cm| result << cm[:sha]}
        else
          commits_in_branch = @client.commits(full_name, params[:branch])
          @client.commits(full_name).each { |cm| result << cm[:sha]}
        end
        commits_in_branch.each do |branched|
          unless result.include?(branched.sha)
            @commits << Commit.new(branched)
          end
        end
      end

      def find_specific_commit
        commit_data = @client.commit(full_name, params[:sha])
        @commit = Commit.new(commit_data)
      end

      def find_all_commits
        @commits = []
        if params[:branch]
          obtain_branch_commits
        else
          commits_data = @client.commits(full_name)
          commits_data.each do |commit|
            @commits << Commit.new(commit)
          end
        end
      end

      def find_all_commits_between
        @commits = []
        if params[:branch]
          obtain_branch_commits
        else
          commits_data = @client.commits_between(full_name, params[:since],
                                              params[:until])
          commits_data.each do |commit|
            @commits << Commit.new(commit)
          end
        end
      end
    end
  end
end
