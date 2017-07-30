class AddCleanersCitiesRelation < ActiveRecord::Migration
  def change
    create_table :cities_cleaners do |t|
      t.belongs_to :city, null: false
      t.belongs_to :cleaner, null: false
    end
  end
end
