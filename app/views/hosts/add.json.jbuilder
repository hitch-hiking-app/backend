json.hosts do
  json.seats_available @host.seats_available #- @host.riders.count
end
