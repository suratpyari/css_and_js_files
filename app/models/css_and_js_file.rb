class CssAndJsFile < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :file_type, :content]

  validates :name, :presence => true
  validates_uniqueness_of :name, :scope => [:file_type]
  scope :css, where(:file_type => 'css')
  scope :js, where(:file_type => 'js')
  
  after_save :modify_file
  
  def modify_file
    dir = (self.file_type == 'js' ? "javascripts" : "stylesheets")
    old_file =Rails.root+"public/#{dir}/_#{CssAndJsFile.find(self.id).name}.#{self.file_type}"
    File.delete(old_file) if File.exist?(old_file)
    file_name = Rails.root+"public/#{dir}/#{self.name}.#{self.file_type}"
    File.exist?(file_name) ? open(file_name, 'w'){|f| f<< "\n\n/* Updated on #{Time.now}*/\n\n"+self.content} : (File.new(file_name,  "w") << "\n\n/* Updated on #{Time.now}*/\n\n"+self.content)
  end
  
  def file_name
    self.name+"."+self.file_type
  end
  
  def path
    dir = (self.file_type == 'js' ? "javascripts" : "stylesheets")
    Rails.root+"public/#{dir}/#{self.name}.#{self.file_type}"
  end
  
end
