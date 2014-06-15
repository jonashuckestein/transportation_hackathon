Transportation::Application.routes.draw do

  get "/groups", to: "groups#index"
  get "/map", to: "groups#map"
  get "/request_ride(.:format)", to: "groups#request_ride"
  get "/reset", to: "groups#reset"

  root to: "landing#default"
end
