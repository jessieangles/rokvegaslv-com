ActionController::Routing::Routes.draw do |map|

  map.resources :reservations,
    :controller => 'promoter/reservations',
    :only => [:index, :new, :create],
    :collection => {:thanks => :get}

  map.resources :guestlists,
    :controller => 'promoter/guestlists',
    :only => [:index, :new, :create],
    :collection => {:thanks => :get}

  map.resources :contacts,
    :controller => 'promoter/contacts',
    :only => [:index, :new, :create],
    :collection => {:thanks => :get}

end