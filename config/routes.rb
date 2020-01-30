Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "post_images#index"

  resources :post_images, only: [:new, :create, :index, :show] do #onlyは、生成するルーティングを限定するオプション
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy] #単数にすると、そのコントローラのidがリクエストに含まれなくなります
  	#今回、コメントの詳細ページは作成しません。post_commentsのshowページが不要で、idの受け渡しも必要ないので、resourceとなっています
  end
end
