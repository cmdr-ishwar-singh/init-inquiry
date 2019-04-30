class CreateInitInquiryInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :init_inquiry_inquiries do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :email
      t.integer :status ,default: 1

      t.timestamps
    end
  end
end
