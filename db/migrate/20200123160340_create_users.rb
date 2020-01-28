class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name 
      t.text :contact_information
      t.text :list_of_events
      t.text :user_type
  end
end
end
