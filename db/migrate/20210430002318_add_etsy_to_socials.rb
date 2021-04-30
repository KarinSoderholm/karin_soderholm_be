class AddEtsyToSocials < ActiveRecord::Migration[5.2]
  def change
    add_column :socials, :etsy, :string
  end
end
