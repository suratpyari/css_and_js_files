module Admin
  class CssAndJsFilesController < Admin::BaseController

    crudify :css_and_js_file,
            :title_attribute => 'name', :xhr_paging => true

  end
end
