class AddInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lang_id, :string, null: false, default: 'EN'
    add_column :users, :company_name, :string, null: false, default: ''
    add_column :users, :business_type, :string, null: false, default: ''
    add_column :users, :company_url, :string, null: false, default: ''
    add_column :users, :department_name, :string, null: false, default: ''
    add_column :users, :kana_sei, :string, null: false, default: ''
    add_column :users, :kana_mei, :string, null: false, default: ''
  end
end
