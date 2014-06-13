Transportation::Application.routes.draw do

  ### ADMIN ###

  namespace :admin do
    require "sidekiq/web"
    require "sidetiq/web"
    mount Sidekiq::Web => "/sidekiq"
  end

  root to: "landing#default"
end
