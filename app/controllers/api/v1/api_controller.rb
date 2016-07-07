  module Api
  module V1
    class ApiController < ApplicationController
      before_action :client

      def organization id
        Organization.new id
      end

      def repositories id
        @repositories = []
        repository_list = client.org_repos(id)
        repository_list.each do |repository|
          @repositories << Repository.new(repository)
        end
        @repositories
      end

      private

      def client
        @client = GithubData.new.client
      end
    end
  end
end
