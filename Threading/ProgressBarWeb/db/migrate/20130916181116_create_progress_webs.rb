class CreateProgressWebs < ActiveRecord::Migration
  def change
    create_table :progress_webs do |t|
      t.string :url

      t.timestamps
    end
  end
end
