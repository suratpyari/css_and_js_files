User.find(:all).each do |user|
  user.plugins.create({
    :name => "css_and_js_file",
    :position => (user.plugins.maximum(:position) || -1) +1
  }) unless user.plugins.find_by_name('css_and_js_file').present?
end

unless Page.find_by_link_url('/css_and_js_file').present?
  page = Page.create({
    :title => "CssAndJsFile",
    :link_url => "/css_and_js_file",
    :menu_match => "\/css_and_js_file(|\/.+?)",
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1)
  })
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end