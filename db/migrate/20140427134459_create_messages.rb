class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to
      t.string :from
      t.string :body
      t.string :identifier

      t.timestamps
    end
  end
end
