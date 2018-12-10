class AddNameAndEmailToTickets < ActiveRecord::Migration[5.0]
  def up
    add_column :tickets, :first_name, :string, null: true, default: 'Kieran'
    add_column :tickets, :last_name, :string, null: true, default: 'Rigby'
    add_column :tickets, :email, :string, null:true, default: 'kieran@kierigby.com'

#

    change_column :tickets, :first_name, :string, null: false
    change_column :tickets, :last_name, :string, null: false
    change_column :tickets, :email, :string, null: false

  end

  def down
    remove_column :tickets, :first_name
    remove_column :tickets, :last_name
    remove_column :tickets, :email
  end
end
