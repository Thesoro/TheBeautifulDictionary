BeautifulDictionary::Application.routes.draw do

  resources :words, only: [:show]
  root "static#home"

  # search by word
  get 'w/:spelling', to: 'searcher#spelling'

  namespace :api do
    namespace :v1 do
      get '/words/starting_with', to: 'word_search#starting_with'
      get '/words/ending_with',   to: 'word_search#ending_with'
      get '/words/containing',    to: 'word_search#containing'
    end
  end



end
