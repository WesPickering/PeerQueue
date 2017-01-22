class CreateQueuedUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :queued_users do |t|
      t.string :Name
      t.string :Question
      t.string :Status
      t.boolean :PeerHelp
      t.integer :dbID
      t.boolean :beingHelped

      t.timestamps
    end
  end
end
