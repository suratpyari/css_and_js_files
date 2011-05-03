# css_and_js_files plugin for [RefineryCMS](http://www.refinerycms.com) ([Github]())

By: [Surat Pyari]()

This Plugin allows you to write/edit css and javascript files without restarting the server.

## Requirements

This engine requires RefineryCMS version >= 0.9.9.16

## Gem Installation

Ensure you have created your application's database

Open your ``Gemfile`` and add this line to the bottom:

    gem 'refinerycms-css_and_js_file'

Now run ``bundle install`` and once bundler has installed the gem run:

    rails generate refinerycms_css_and_js_files
    rake db:migrate

edit your application.html.erb and add these lines

		<% CssAndJsFile.css.each do |css|%>
	  	<%= stylesheet_link_tag css.name+'.css' , :cache => '_'+css.name %>
		<% end %>
		<% CssAndJsFile.js.each do |js|%>
	  	<%= javascript_include_tag js.name+'.js' , :cache => '_'+js.name %>
		<% end %>

Now, restart your web server and enjoy.