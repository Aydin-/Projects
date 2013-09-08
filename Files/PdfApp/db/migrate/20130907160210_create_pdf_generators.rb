class CreatePdfGenerators < ActiveRecord::Migration
  def change
    create_table :pdf_generators do |t|
      t.string :url
      t.string :filepath
      t.string :fd1
      t.string :fd2

      t.timestamps
    end
  end
end
