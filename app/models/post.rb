# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :text
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :author_id, presence: true
  #TODO: Consider validating :post_subs
  # validates :post_subs, presence: true

  belongs_to :author,
    class_name: :User

  has_many :post_subs

  has_many :subs, dependent: :destroy,
    through: :post_subs,
    source: :sub
end
