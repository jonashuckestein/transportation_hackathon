class Group < ActiveRecord::Base
  serialize :route
  validates :leave_at, :leave_from, presence: true

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

  def route
    loft = [52.505891, 13.393171]
    a_users = users.sort {|a,b| a.distance_from(loft) <=> b.distance_from(loft)}
    a_users.map {|u| {user: u, lat: u.dest_lat, long: u.dest_long, distance: u.distance_from(loft) }}
  end
end
