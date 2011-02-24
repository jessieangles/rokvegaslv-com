namespace :promoter do
  namespace :event_select do
    
    desc "Refresh the cached list of events."
    task :refresh => :environment do
      EventSelect.refresh
    end
    
  end

  namespace :area_select do
    
    desc "Refresh the cached list of areas."
    task :refresh => :environment do
      AreaSelect.refresh
    end
    
  end
end