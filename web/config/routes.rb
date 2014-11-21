Rails.application.routes.draw do
  get 'videos', to: 'videos#videos'
  get 'videos/list/:id', to: 'videos#list'
  get 'videos/view/:topic/:id', to: 'videos#view'

  get 'videos/admin', to: 'admin#admin'
  post 'admin/login', to: 'admin#login'
  get 'admin/logout', to: 'admin#logout'
  get 'admin/home', to: 'admin#home'
  get 'admin/video_list/:start', to: 'admin#video_list'
  get 'admin/video_list', to: 'admin#video_list'
  get 'admin/video_view/:id', to: 'admin#video_view'
  get 'admin/video_new', to: 'admin#video_new'
  post 'admin/video_add', to: 'admin#video_add'
  get 'admin/video_edit/:id', to: 'admin#video_edit'
  post 'admin/video_update/:id', to: 'admin#video_update'
  get 'admin/video_delete/:id', to: 'admin#video_delete'
  get 'admin/topic_list', to: 'admin#topic_list'

  root 'videos#videos'
end
