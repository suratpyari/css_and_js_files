require 'refinerycms-base'

module Refinery
  module CssAndJsFiles
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "css_and_js_files"
          plugin.activity = {
            :class => CssAndJsFile,
            :title => 'name'
          }
        end
      end
    end
  end
end
