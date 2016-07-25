require 'octokit'

class AdminController < ApplicationController
  before_action :authenticate_user!

  def github_client
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end
end
