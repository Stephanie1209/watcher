require 'octokit'

class PullRequestService
  attr_reader :pull_request

  def initialize repository_id, pull_request_number
    @pull_request_number = pull_request_number
    @client = Octokit::Client.new(access_token: ENV["GITHUB_ACCESS_TOKEN"])
    @repository = Repository.find_by_name(repository_id)
    @organization = Organization.find_by_github_name(@repository.organization.github_name)
  end

  def obtains_pull_request_data
    @data = @client.issue("#{@organization.github_name}/#{@repository.name}", @pull_request_number)
  end

  def creates_or_updates_pull_request
    obtains_pull_request_data
    @pull_request = @repository.pull_requests.find_by_github_number(@pull_request_number) || @repository.pull_requests.new

    if !@data["labels"].empty?
      array_of_labels = []
      @data["labels"].each do |label|
        array_of_labels << label["name"]
      end
      string_of_labels = array_of_labels.join(", ")
      @pull_request.update(labels: string_of_labels)
    end

    @pull_request.update(
                         github_account: @data["user"]["login"],
                         title: @data["title"],
                         description: @data["body"],
                         status: @data["state"],
                         repository_id: @repository.id,
                         github_number: @data["number"],
                         github_id: @data["id"]
                        )
  end
end

