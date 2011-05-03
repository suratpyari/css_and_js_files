require 'spec_helper'

describe CssAndJsFile do

  def reset_css_and_js_file(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @css_and_js_file.destroy! if @css_and_js_file
    @css_and_js_file = CssAndJsFile.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_css_and_js_file
  end

  context "validations" do
    
    it "rejects empty name" do
      CssAndJsFile.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_css_and_js_file
      CssAndJsFile.new(@valid_attributes).should_not be_valid
    end
    
  end

end