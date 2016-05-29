class Team < ActiveRecord::Base
	has_attached_file :flag, styles: { medium: "30x30>", thumb: "100x100>" }
  	validates_attachment_content_type :flag, content_type: /\Aimage\/.*\Z/

  	has_attached_file :fans, styles: { medium: "500x280>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :fans, content_type: /\Aimage\/.*\Z/

    has_attached_file :facilities1, styles: { medium: "500x280>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :facilities1, content_type: /\Aimage\/.*\Z/

    has_attached_file :facilities2, styles: { medium: "500x280>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :facilities2, content_type: /\Aimage\/.*\Z/

	belongs_to :league
	belongs_to :country

  has_many :comments

end
