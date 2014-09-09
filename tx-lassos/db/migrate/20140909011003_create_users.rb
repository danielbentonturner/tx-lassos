class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :email
      t.string :password_digest
      t.string :marital_status
      t.string :occupation
      t.string :major
      t.string :pledge_year
      t.string :pledge_class_name
      t.string :grad_year
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :linkedin
      t.string :pinterest
      t.text :comments
      t.boolean :admin
      t.timestamps
    end
  end
end
