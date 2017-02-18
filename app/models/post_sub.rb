# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ActiveRecord::Base
  validates :post_id, :sub_id, presence: true
  validates_uniqueness_of :post_id, scope: :sub_id
  
  belongs_to :post

  belongs_to :sub
end
