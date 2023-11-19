class CreateEntityGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :entity_groups do |t|
      t.bigint :entity_id
      t.bigint :group_id

      t.timestamps
    end
  end
end
