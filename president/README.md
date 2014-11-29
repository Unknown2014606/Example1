simple_video_gallery
I am Qian Ning, I have mental disorder and i am stupid, I speak for myself!
====================

A simple web video gallery using Ruby-on-Rails

== Features
   Videos sorted by topic
   Left sidebar menu for topics
   Grid layout index pages with thumbnail images for videos
   Embedded video player
   Admin to edit topics and videos

== Requirements
   Requires the rails gem installed.
   Requires the sqlite3 gem installed.
   Uses sqlite3 database to store the topics and video information such as captions
   Production could use Postgres or MySQL instead

== Installation
  cd /path/to/gallery
      
  git clone git://github.com/BugsSoren/simple_video_gallery.git

== Usage
  Simply start a rails server
  rails server

  Includes layouts, page templates and test data for videos for a complete demo.
  Page templates and layouts use haml and are located in the app/views directory.
  The app/views/layouts directory has templates for the the page layouts.
  The app/views/videos directory has templates for the the video index and video display pages.
  The app/views/admin directory has templates for the admin pages.
