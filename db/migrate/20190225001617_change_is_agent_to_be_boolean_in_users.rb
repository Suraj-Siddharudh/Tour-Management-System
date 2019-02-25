class ChangeIsAgentToBeBooleanInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_agent, :boolean
    change_column :users, :is_customer, :boolean
  end
end
