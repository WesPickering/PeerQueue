json.extract! queued_user, :id, :Name, :Question, :Status, :PeerHelp, :created_at, :updated_at, :dbID, :beingHelped
json.url queued_user_url(queued_user, format: :json)
