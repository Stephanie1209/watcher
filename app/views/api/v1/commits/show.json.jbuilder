json.sha @commit.sha
json.author @commit.author
json.message @commit.message
json.stats do
  json.additions @commit.additions
  json.deletions @commit.deletions
  json.total @commit.total
end
