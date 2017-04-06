class CreateFeedsAndEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.string   :title,         null: false
      t.string   :url,           null: false

      t.datetime :last_modified
      t.datetime :created_at,    null: false
      t.datetime :updated_at,    null: false
    end

    create_table :entries do |t|
      t.integer :feed_id,        null: false

      t.string :title,           null: false
      t.string :url,             null: false
      t.string :author
      t.string :content
      t.string :entry_id

      t.datetime :entry_published_at
      t.datetime :entry_updated_at
      t.datetime :created_at,    null: false
      t.datetime :updated_at,    null: false
    end
  end
end
