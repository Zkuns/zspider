class CreateTheUseLessTable < ActiveRecord::Migration
  def change
    create_table :spiders do |t|
    end
    create_table :https do |t|
    end
    create_table :decoders do |t|
    end
    create_table :zqueues do |t|
    end
  end
end
