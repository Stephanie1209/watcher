require 'octokit'

class IssueService
  def initialize repository_id, issue_number
    @issue_number = issue_number
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    @repository = Repository.find_by_name(repository_id)
    @organization = Organization.find_by_github_name(@repository.organization.github_name)
  end

  def obtains_issues_data
    @data = @client.issue("#{@organization.github_name}/#{@repository.name}", @issue_id)
  end

  def creates_or_updates_issue
    obtains_issues_data
    @issue = @repository.issues.find_by_github_number(@issue_number) || @repository.issues.new
    @issues.update(
                   github_account: @data["user"]["login"],
                   title: @data["title"],
                   description: @data["body"],
                   labels: @data["labels"]["name"],
                   status: @data["state"],
                   repository_id: @repository.name,
                   github_number: @data["number"],
                   github_id: @data["id"]
                  )
  end
end
