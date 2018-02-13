class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', optional: true
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.get_user_full_name(id)
    @full_name = User.find(id).first_name + " " + User.find(id).last_name
  end
end
