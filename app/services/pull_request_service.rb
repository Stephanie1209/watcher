require 'octokit'

class PullRequestService
  attr_reader :pull_request

  def initialize repository_id, pull_request_number = nil
    @pull_request_number = pull_request_number
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    @repository = Repository.find_by_name(repository_id)
    @organization = Organization.find_by_github_name(@repository.organization.github_name)
  end

  def obtains_pull_request_data
    if @pull_request_number == nil
      @data = @client.list_issues("#{@organization.github_name}/#{@repository.name}", issues_query_options)
      @data.keep_if { |issue| issue["pull_request"] != nil }
    else
      data_hash = @client.issue("#{@organization.github_name}/#{@repository.name}", @pull_request_number)
      @data = []
      @data << data_hash
    end
  end

  def creates_or_updates_pull_request
    obtains_pull_request_data

    @data.each do |data|
      @pull_request = @repository.pull_requests.find_by_github_number(data["number"]) || @repository.pull_requests.new

      if !data["labels"].empty?
        string_of_labels = data["labels"].map { |label| label[:name] }.join(", ")
        @pull_request.update(labels: string_of_labels)
      else
        @pull_request.update(labels: "")
      end

      if data["assignee"] != nil
        @pull_request.update(assignee: data["assignee"]["login"])
      end

      @pull_request.update(
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
