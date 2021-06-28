class CreateResponse < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :response
      t.string :guest_name
      t.string :guest_email
      t.references :blog_post, foreign_key: true

      t.timestamps
    end
  end
end
