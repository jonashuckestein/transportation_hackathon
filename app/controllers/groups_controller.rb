class GroupsController < ApplicationController

  respond_to :json

  def map
    @groups = []
    Group.all.each do |g|
      @groups << {
        id: g.id,
        users: g.users.as_json,
        description: g.description,
        circle_center_lat: g.circle_center_lat,
        circle_center_long: g.circle_center_long,
        circle_radius: g.circle_radius
      }
    end
  end

  def request_ride
    user = User.new(user_params)
    user.profile_image = "empty.jpg"
    user.leave_before = user.leave_after + 1.hour
    user.save!
    @group = user.group
  end

  def index
    @groups = Group.all
  end

private
  def user_params
    params.require(:user).permit(:name, :leave_after, :leave_before, :destination_address, :has_car, :car_spots)
  end
end
