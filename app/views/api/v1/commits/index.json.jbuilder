json.commits @commits.each do |commit|
  json.sha commit.sha
  json.author commit.committer_name
  json.message commit.message
  json.date commit.date.strftime("%Y/%m/%d %H:%M:%S %Z")
end
