User.all.each do |user|
  if user.plugins.where(:name => 'css_and_js_files').blank?
    user.plugins.create(:name => 'css_and_js_files',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end