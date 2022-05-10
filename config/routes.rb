Rails.application.routes.draw do
  scope :avo do
    get "custom_tool", to: "avo/tools#custom_tool"
  end
  mount Avo::Engine, at: Avo.configuration.root_path
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
