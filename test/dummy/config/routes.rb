Rails.application.routes.draw do
  mount Photos::Engine => '/', as: 'photos'
end
