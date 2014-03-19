if Rails.env.development?
  ActiveSupport::Dependencies.explicitly_unloadable_constants << "Iwakfu::API"
  
  api_reloader = ActiveSupport::FileUpdateChecker.new(Dir["#{Rails.root}/app/api/**/*.rb"]) do
    Rails.application.reload_routes! # or do something better here    
  end

  ActionDispatch::Reloader.to_prepare do
    api_reloader.execute_if_updated
    Rails.logger.debug "!Reload Api OK"
    
  end
end