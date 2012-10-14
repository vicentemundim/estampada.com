EstampadaCom::Application.routes.draw do
  namespace :admin do
    match '/' => redirect('/admin/pages')

    resources :pages, only: [:index, :show] do
      collection do
        get :by_slug
      end

      resources :snippets, only: [:edit, :update] do
        resources :photos, only: [:new, :edit, :create, :update, :destroy] do
          post :reorder, on: :collection
        end
        put :update_status
        post :reorder, on: :collection
      end

      resources :photos, only: [:new, :edit, :create, :update, :destroy] do
        post :reorder, on: :collection
      end
    end
  end

  match '/' => 'pages#index', as: :home
  match '/us' => 'pages#us', as: :us
  match '/products' => 'pages#products', as: :pillow_products
  match '/orders' => 'pages#orders', as: :orders
  match '/shop' => 'pages#shop', as: :shop
  match '/contact' => 'pages#contact', as: :contact

  root to: 'pages#index'
end
