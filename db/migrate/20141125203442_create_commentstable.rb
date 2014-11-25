class CreateCommentstable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.text :comment
      t.timestamps
    end
  end
end
