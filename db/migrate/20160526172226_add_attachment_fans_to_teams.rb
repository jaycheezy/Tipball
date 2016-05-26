class AddAttachmentFansToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :fans
    end
  end

  def self.down
    remove_attachment :teams, :fans
  end
end
