class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :url
      t.text :file

      t.timestamps null: false
    end
  end
end
