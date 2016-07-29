require 'octokit'

class BranchService
  attr_reader :branch

  def initialize repository_id, branch_id = nil
    @branch = nil
    @repository = Repository.find_by_name(repository_id)
    @branch_id = branch_id
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
  end

  def obtains_branch_data
    organization = @repository.organization
    fullname = "#{organization.github_name}/#{@repository.name}"
    if @branch_id
      @data = @client.branch(fullname, @branch_id)
    else
      @data = @client.branches(fullname)
    end
  end

  def creates_or_updates_specific_branch
    obtains_branch_data
    unless @repository.branches.find_by_name(@data["name"])
     @branch = @repository.branches.create(name: @data["name"])
    end
  end

  def creates_or_updates_branches
    obtains_branch_data
    @data.each do |branch_data|
      unless @repository.branches.find_by_name(branch_data["name"])
       @branch = @repository.branches.create(name: branch_data["name"])
      end
    end
    deletes_non_existing_branches @data
  end

  def deletes_non_existing_branches data
    branch_names = []
    data.each { |branch| branch_names << branch["name"] }
    @repository.branches.each do |branch|
      branch.destroy unless branch_names.include?(branch.name)
    end
  end
end
