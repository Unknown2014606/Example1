class VideosController < ApplicationController
  def video_menu()
    top = Array.new
    menu = Array.new;
    list = Topic.all #("select * from topic")
    list.each do |topic|
      item = {:link => "/videos/list/#{topic['id']}", :id => topic['id'],:parent => topic['parent'],
        :text => topic['topic'],:active => @topicid == topic['id'] , :children => Array.new}
      menu.push(item)
      top.push(item) if topic['parent'] == 0
    end

    menu.each do |item|
      unless item[:parent] == 0
        at = menu.find_index { |parent| parent[:id] == item[:parent]}
        parent = menu.fetch(at)
        parent[:children].push(item)
      end
    end
    top.sort! { |a,b| a[:text] <=> b[:text] }
    top.each do |item|
        item[:children].sort! { |a,b| a[:text] <=> b[:text] }
    end
    @menu = {:sections => [
      {:heading => 'Video Topics', :items => top}
    ]}
  end

  def video_render(template)
    video_menu()
    render layout: 'layout', template: "videos/#{template}"
  end

  def videos
    @topid = 15
    @list = Video.where("topic = ?",@topid)
    video_render('vidgrid')
  end

  def list
    @topid = params[:id]
    @topic = Topic.find(@topid)
    @topic = @topic.nil? ? 'Amateur Radio' : @topic['topic']
    @list = Video.where("topic = ?",@topid)
    video_render('vidgrid')
   end

  def view
    @id = params[:id]
    @topid = params[:topic]
    @topurl = "/videos/list/#{@topid}"
    @topic = Topic.find(@topid)
    @video = Video.find(@id)
    video_render('vidview')
   end
end
