Refinery::Application.routes.draw do
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :css_and_js_files, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
