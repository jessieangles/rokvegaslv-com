class Event < ActiveResource::Base

  if VENUE_DRIVER[:local_server]
    puts "Looking for Venue Driver on port 3000."
    self.site = "http://localhost:3000/api/venues/:venue_id/events/:event_id"
    self.user = "ryan"
    self.password = "password"
  else
    self.site = "http://venuedriver.com/api/venues/:venue_id/events/:event_id"
    self.user = VENUE_DRIVER[:username]
    self.password = VENUE_DRIVER[:password]
  end
  
end
