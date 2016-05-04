json.hosts do
  json.seats_available @host.seats_available - @host.riders.count
<<<<<<< HEAD
  #json.extract! @rider, :user_id, :host_id
=======
>>>>>>> d9443fe87d911cbbf9db15695073b6c376b5dd34
end
