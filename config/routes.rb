Rails.application.routes.draw do

  root to: 'search#frontpage'

  # Our app is one controller for gods sake,
  # let's keep it simple.
  get "/:action" => "search"

end
