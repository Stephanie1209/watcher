require 'octokit'

class IssueService
  attr_reader :issue

  def initialize repository_id, issue_number = nil
    @issue_number = issue_number
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    @repository = Repository.find_by_name(repository_id)
    @organization = Organization.find_by_github_name(@repository.organization.github_name)
  end

  def obtains_issues_data
    if @issue_number == nil
      @data = @client.list_issues("#{@organization.github_name}/#{@repository.name}", issues_query_options)
      @data.keep_if { |issue| issue["pull_request"] == nil }
    else
      data_hash = @client.issue("#{@organization.github_name}/#{@repository.name}", @issue_number)
      @data = []
      @data << data_hash
    end
  end

  def creates_or_updates_issue
    obtains_issues_data

    @data.each do |data|
      @issue = @repository.issues.find_by_github_number(data["number"]) || @repository.issues.new
      if !data["labels"].empty?
        string_of_labels = data["labels"].map { |label| label[:name] }.join(", ")
        @issue.update(labels: string_of_labels)
      end

      if data["assignee"] != nil
        @issue.update(assignee: data["assignee"]["login"])
      end

      @issue.update(
                     github_account: data["user"]["login"],
                     title: data["title"],
                     description: data["body"],
                     status: data["state"],
                     github_number: data["number"],
                     github_id: data["id"],
                     started_at: data["created_at"]
                    )
    end
  end

  private

  def issues_query_options
    { filter: "all", state: "all", query: {per_page:1000, page: 1} }
  end
end
