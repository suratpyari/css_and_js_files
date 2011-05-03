class CreateStructureForCssAndJsFiles < ActiveRecord::Migration
  def self.up
    create_table :css_and_js_files do |t|
      t.string :name
      t.string :file_type
      t.text :content
      t.integer :position

      t.timestamps
    end

    add_index :css_and_js_files, :id

    load(Rails.root.join('db', 'seeds', 'css_and_js_file.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "css_and_js_file"})

    Page.delete_all({:link_url => "/css_and_js_file"})

    drop_table :css_and_js_files
  end
end