require 'octokit'

class IssueService
  attr_reader :issue

  def initialize repository_id, issue_number
    @issue_number = issue_number
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    @repository = Repository.find_by_name(repository_id)
    @organization = Organization.find_by_github_name(@repository.organization.github_name)
  end

  def obtains_issues_data
    @data = @client.issue("#{@organization.github_name}/#{@repository.name}", @issue_number)
  end

  def creates_or_updates_issue
    obtains_issues_data
    @issue = @repository.issues.find_by_github_number(@issue_number) || @repository.issues.new

    if !@data["labels"].empty?
      string_of_labels = @data["labels"].map { |label| label[:name] }.join(", ")
      @issue.update(labels: string_of_labels)
    end

    @issue.update(
                   github_account: @data["user"]["login"],
                   title: @data["title"],
                   description: @data["body"],
                   status: @data["state"],
                   github_number: @data["number"],
                   github_id: @data["id"]
                  )
  end
end
