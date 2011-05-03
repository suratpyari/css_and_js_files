Given /^I have no css_and_js_files$/ do
  CssAndJsFile.delete_all
end

Given /^I (only )?have css_and_js_files titled "?([^\"]*)"?$/ do |only, titles|
  CssAndJsFile.delete_all if only
  titles.split(', ').each do |title|
    CssAndJsFile.create(:name => title)
  end
end

Then /^I should have ([0-9]+) css_and_js_files?$/ do |count|
  CssAndJsFile.count.should == count.to_i
end
