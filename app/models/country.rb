class Country < ActiveRecord::Base
	has_attached_file :flag, styles: { medium: "30x30>", thumb: "100x100>" },

    validates_attachment_content_type :flag, content_type: /\Aimage\/.*\Z/

  	has_many :leagues
  	has_many :teams
end
