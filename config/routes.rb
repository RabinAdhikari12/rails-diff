Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :menus do
#    collection do
#      get :goi
#    end
  end
  
  resources :gois do
    collection do
      get :vocab_double
      post :lang
    end
  end

  resources :foreigns do
    collection do
      get :kanji_vocab
      post :lang
    end
  end

  resources :kanjis do
    collection do
      get :kanji_vocab
#      post :lang
    end
  end

  resources :kanji_scrolls do
    collection do
      get :kanji_vocab
#      post :lang
    end
  end

  resources :kanji_units do
    collection do
      get :kanji_vocab
      get :parts_kanji
#      post :lang
    end
  end

  resources :parts do
    collection do
      get :kanji_vocab
      get :parts_kanji
      get :part
    end
  end

  resources :users do
  end

  resources :vocab_mycards do
    collection do
      get :page_mylang
      get :vocab
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'menus#index'
end
