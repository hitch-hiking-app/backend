json.hosts do
  json.seats_available @host.seats_available - @host.riders.count
  #json.extract! @rider, :user_id, :host_id
end
