json.commits @commits.each do |commit|
  json.sha commit.sha
  json.author commit.author
  json.message commit.message
  json.created_at commit.committed_at.strftime("%Y/%m/%d %H:%M:%S %Z")
end
