class Group < ActiveRecord::Base
  serialize :route
  validates :leave_at, :leave_from, :route, presence: true

  has_many :users

  belongs_to :driver, class_name: "User"

  def has_car?
    driver_id.present?
  end

  def users_except_newest
    a_users = users.order("id desc").to_a
    a_users.shift
    a_users
  end
end
