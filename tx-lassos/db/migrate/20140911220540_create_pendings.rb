class CreatePendings < ActiveRecord::Migration
  def change
    create_table :pendings do |t|
      t.string :name
      t.string :pledge_class
      t.string :pledge_class_name
      t.string :grad_year
      t.string :major
      t.string :street
      t.string :city_state
      t.string :email
      t.string :email2
      t.string :phone
      t.string :employer  
      t.string :job_title
      t.string :comments
      t.boolean :pending, default: true
      t.timestamps
    end
  end
end