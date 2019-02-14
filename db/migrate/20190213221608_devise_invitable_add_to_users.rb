class DeviseInvitableAddToUsers < ActiveRecord::Migration[5.2]
  def up
    change_table :users do |t|
      t.string     :invitation_token
      t.datetime   :invitation_created_at
      t.datetime   :invitation_sent_at
      t.datetime   :invitation_accepted_at
      t.integer    :invitation_limit
      t.integer    :invited_by_admin_id
      t.integer    :invitations_count, default: 0
      t.index      :invitations_count
      t.index      :invitation_token, unique: true # for invitable
      t.index      :invited_by_admin_id
    end
  end

  def down
    change_table :users do |t|
      t.remove :invitation_token
      t.remove :invitation_created_at
      t.remove :invitation_sent_at
      t.remove :invitation_accepted_at
      t.remove :invitation_limit
      t.remove :invited_by_admin_id
      t.remove :invitations_count
    end
  end
end
