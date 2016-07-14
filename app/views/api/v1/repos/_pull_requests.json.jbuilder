json.pull_requests pull_requests do |pr|
  json.id pr.id
  json.github_url pr.github_url
  json.number pr.number
  json.title pr.title
  json.body pr.body
  json.author pr.author
  json.labels pr.labels
  json.assignee pr.assignee if pr.assignee != nil
  json.created_at pr.created_at
end
