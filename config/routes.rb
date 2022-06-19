Rails.application.routes.draw do
  locale_scope = Regexp.new((I18n.available_locales = LANGUAGES.map {|lang| lang[1]}).join('|'))
  scope '(:locale)', :locale => locale_scope do
    root   'mht_frame#home', via: :all
    get    '/contact',       to: 'mht_frame#contact'
    get    '/help',          to: 'mht_frame#help'
    get    '/about',         to: 'mht_frame#about'
    get    '/news',          to: 'mht_frame#news'
    get    '/signup',        to: 'users#new'
    get    '/login',         to: 'sessions#new'
    post   '/login',         to: 'sessions#create'
    delete '/logout',        to: 'sessions#destroy'
    resources               :users
    resources               :account_activations, only: [:edit]
    resources               :password_resets,     only: [:new, :create, :edit, :update]
    resources               :projects,            only: [:index, :show, :new, :create, :edit, :update]
    resources               :buildings,           only: [:index, :show, :edit, :update]
    resources               :units,               only: [:index, :show, :edit, :update]
  end
end