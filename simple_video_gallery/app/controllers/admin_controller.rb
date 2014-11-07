class AdminController < ApplicationController
  before_action :authenticate
  skip_before_action :authenticate, only: [:admin, :login]

  def admin_render(template)
    render layout: 'layout-admin', template: "admin/#{template}"
  end

  def display_list(start)
#FIXME - add list paging
    limit = 15
    max = Video.count
    @list = Video.all().offset(start).limit(limit)
    @prev = start - limit
    @next = start + limit
    @next = -1 if @next > max
    admin_render('video-list')
  end

  def get_topics()
    top = Array.new
    topics = Array.new;
    list = Topic.all()
    list.each do |topic|
      item = {:id => topic['id'],:parent => topic['parent'],
        :text => topic['topic'],:children => Array.new}
      topics.push(item)
      top.push(item) if topic['parent'] == 0
    end

    topics.each do |item|
      unless item[:parent] == 0
        at = topics.find_index { |parent| parent[:id] == item[:parent]}
        parent = topics.fetch(at)
        parent[:children].push(item)
      end
    end
    return top
  end

  def topic_render
    @list = get_topics()
    render layout: 'layout-admin', template: "admin/topic-add"
  end

#----
  def admin
    render layout: 'layout-basic', template: 'admin/login'
  end

  def login
    if (defined? params[:login]) && (params[:login] == 'admin') &&
      (defined? params[:password]) && (params[:password] == 'pass')
      session[:user_id] = 'admin'
      redirect_to(:action => 'home')
    else
      redirect_to(:action => 'admin')
    end
  end

  def logout
      session[:user_id] = nil
      redirect_to(:controller => 'videos', :action => 'videos')
  end

  def home
    admin_render('admin-home')
  end

  def video_list
    start = (defined? params[:start]) ? params[:start] : 0
    display_list(start.to_i)
  end

  def video_view
    @video = Video.find_by_id(params[:id])
    admin_render('video-view')
  end

  def video_new
    @topics = get_topics()
    @video = Video.new
    admin_render('video-add')
  end

  def video_add
    @video = Video.new(video_params)
    if @video.save
      redirect_to(:action => 'video_list')
    else
      admin_render('video-add')
    end
  end

  def video_edit
    @topics = get_topics()
    @video = Video.find_by_id(params[:id])
    admin_render('video-edit')
  end

  def video_update
    @video = Video.find_by_id(params[:id])
    if  @video.update_attributes(video_params)
      redirect_to(:action => 'video_list')
    else
      admin_render('video-add')
    end
  end

  def video_delete
    @video = Video.find_by_id(params[:id])
    @video.destroy
    redirect_to(:action => 'video_list')
  end

  def topic_list
    topic_render()
  end

  private
   def video_params
     params.require(:video).permit(:title,:url,:image,:excerpt,:topic,:before_content,:after_content)
   end

  def authenticate
    if !defined? session[:user_id] || session[:user_id].nil?
      redirect_to(:action => 'admin')
    end
  end
end
