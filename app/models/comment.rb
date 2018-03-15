class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes(atr)
    atr.values.each do |value|
      user = user.find_or_create_by(value)
      self.user = user
    end
  end
end
