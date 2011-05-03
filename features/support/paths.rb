module NavigationHelpers
  module Refinery
    module CssAndJsFiles
      def path_to(page_name)
        case page_name
        when /the list of css_and_js_files/
          admin_css_and_js_files_path

         when /the new css_and_js_file form/
          new_admin_css_and_js_file_path
        else
          nil
        end
      end
    end
  end
end
