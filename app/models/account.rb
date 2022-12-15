class Account < ApplicationRecord
  has_one_attached :image, :dependent => :destroy
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :mobile
end
