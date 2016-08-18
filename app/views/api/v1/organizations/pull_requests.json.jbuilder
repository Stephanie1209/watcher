json.pull_requests @pull_requests do |pull_request|
  json.id pull_request.id
  json.github_id pull_request.github_id
  json.number pull_request.github_number
  json.title pull_request.title
  json.body pull_request.description.squish unless pull_request.description.nil?
  json.author pull_request.github_account
  json.labels pull_request.labels unless pull_request.labels.nil?
  json.assignee pull_request.assignee unless pull_request.assignee.nil?
  json.created_at pull_request.started_at
  json.status pull_request.status
end

