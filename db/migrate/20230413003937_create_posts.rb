class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :word,    null:false
      t.text   :mean,    null:false
      t.timestamps
    end
  end
end
