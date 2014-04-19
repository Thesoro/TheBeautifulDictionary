BeautifulDictionary::Application.routes.draw do

  resources :words, only: [:index, :show]
  root "words#index"

  get 'w/:spelling', to: 'searcher#spelling'

end
