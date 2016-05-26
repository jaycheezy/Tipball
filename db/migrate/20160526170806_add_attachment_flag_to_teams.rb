class AddAttachmentFlagToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :flag
    end
  end

  def self.down
    remove_attachment :teams, :flag
  end
end
