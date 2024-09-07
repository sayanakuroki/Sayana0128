class AddImageColorToFlowers < ActiveRecord::Migration[6.1]
  def change
    add_column :flowers, :image_color, :string
  end
end
