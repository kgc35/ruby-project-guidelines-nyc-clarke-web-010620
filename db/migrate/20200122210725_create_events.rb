class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name_of_event
      t.integer :number_of_attendees
      t.text :organizer_of_event
      t.text :contact_information
      t.date :date_of_event
      t.time :time_of_event
      t.text :link_to_calendar
      t.text :location
      t.text :link_to_maps
      t.text :event_description
      t.text :event_photo
      t.text :ticket_price
      t.text :weather_at_location
    end
  end
end
