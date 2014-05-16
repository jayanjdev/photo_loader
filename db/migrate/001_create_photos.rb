class Pnotos< ActiveRecord::Migration
  def self.up
    create_table :photos |t|
      t.string :location
      t.string :type
      t.datetime :click_date
    end
  end

  def self.down
    drop_table :photos
  end
end

