json.hosts do
  json.seats_available @host.seats_available
  #json.extract! @rider, :user_id, :host_id
end
