class AddAttachmentFacilities2ToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :facilities2
    end
  end

  def self.down
    remove_attachment :teams, :facilities2
  end
end
