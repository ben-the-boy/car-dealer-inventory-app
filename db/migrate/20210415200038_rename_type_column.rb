class RenameTypeColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :vehicles, :type, :style
  end
end
