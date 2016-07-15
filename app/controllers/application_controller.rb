class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def octokit_client
      GithubData.new.client
    end

    def get_organization
      octokit_client.organization(ENV["github_organization"])
    end
end
