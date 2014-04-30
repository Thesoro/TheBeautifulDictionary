BeautifulDictionary::Application.routes.draw do

  resources :words, only: [:show]
  root "static#home"

  # search by word
  get 'w/:spelling', to: 'searcher#spelling'

end
