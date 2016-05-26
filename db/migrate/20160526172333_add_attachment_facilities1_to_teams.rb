class AddAttachmentFacilities1ToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :facilities1
    end
  end

  def self.down
    remove_attachment :teams, :facilities1
  end
end
