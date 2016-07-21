require 'octokit'

class BranchService
  attr_reader :branch

  def initialize(organization_id, repository_id, branch_id)
    @banch = nil
    @repository_id = repository_id
    @fullname = "#{organization_id}/#{repository_id}"
    @branch_id = branch_id
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end

  def obtains_branch_data
    @data = @client.branch(@fullname, @branch_id)
  end

  def creates_or_updates_branch
    obtains_branch_data
    @repository = Repository.find_by_name(@repository_id)
    @branch = Branch.find_by_name(@data["name"]) ||
                  Branch.new
                  binding.pry
    @organization.update(
                        name: @data["name"],
                        repository_id: @repository
                        )
  end
end
