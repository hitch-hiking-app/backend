json.hosts do
  json.seats_available @host.seats_left #- @host.riders.count
end
