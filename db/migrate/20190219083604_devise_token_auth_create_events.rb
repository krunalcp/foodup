class DeviseTokenAuthCreateEvents < ActiveRecord::Migration[5.1]
  def change
    
    create_table(:events) do |t|
      ## Required
      t.string :provider, :null => false, :default => "name"
      t.string :uid, :null => false, :default => "name"

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :name
      t.string :logo
      t.string :email
      t.boolean :admin, default: false
      t.boolean :active, default: false
      t.string :gst_number

      ## Tokens
      t.string :tokens

      t.timestamps
    end

    add_index :events, :name,                unique: true
    add_index :events, :reset_password_token, unique: true
    add_index :events, :confirmation_token,   unique: true
    # add_index :events, :unlock_token,       unique: true
  end
end