require 'octokit'

class BranchService
  attr_reader :branch

  def initialize(repository_id, branch_id)
    @branch = nil
    @repository = Repository.find_by_name(repository_id)
    @organization = @repository.organization
    @fullname = "#{@organization.github_name}/#{@repository.name}"
    @branch_id = branch_id
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end

  def obtains_branch_data
    @data = @client.branch(@fullname, @branch_id)
  end

  def creates_or_updates_branch
    obtains_branch_data
    unless @repository.branches.find_by_name(@data["name"])
      @repository.branches.create(name: @data["name"])
    end
  end
end
