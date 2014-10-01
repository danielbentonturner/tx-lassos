class CreatePendings < ActiveRecord::Migration
  def change
    create_table :pendings do |t|
      t.string :name
      t.string :pledge_class
      t.string :pledge_class_name
      t.string :grad_year
      t.string :major
      t.string :street_address
      t.string :city_state
      t.string :email
      t.string :email2
      t.string :phone
      t.string :other_phone
      t.string :employer  
      t.string :job_title
      t.string :comments
      t.string :perm_address1
      t.string :perm_address2
      t.boolean :pending, default: true
      t.timestamps
    end
  end
end