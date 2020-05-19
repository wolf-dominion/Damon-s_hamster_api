class CreateHamsters < ActiveRecord::Migration[6.0]
  def change
    create_table :hamsters do |t|
      t.string :name
      t.string :age
    end
  end
end
