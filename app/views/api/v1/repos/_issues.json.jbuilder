json.issues issues do |issue|
  json.id issue.id
  json.github_id issue.github_id
  json.number issue.github_number
  json.title issue.title
  json.body issue.description.squish
  json.author issue.github_account
  json.labels issue.labels unless issue.labels.nil?
  json.assignee issue.assignee unless issue.assignee.nil?
  json.created_at issue.started_at
  json.status issue.status
end
