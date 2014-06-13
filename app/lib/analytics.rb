# Provides Analytics.track_event and Tracker.track_traits to track events
# and users in segment.io
class Analytics

  # Thin wrapper around segment.io's track(). In addition to the
  # arguments described in https://segment.io/libraries/ruby#track
  # you can pass a `traits` property.
  #
  # If `traits` is provided, the traits are merged into the event's
  # properties, with keys prefixed by "trait_"
  def self.track_event(options)
    options = {
      user_id: nil, # required
      event: nil, # required
      properties: {},
      traits: nil,
      timestamp: Time.now,
      context: {}
    }.merge(options)

    if options[:traits].present?
      traits = Hash[options[:traits].map { |k, v| ["trait_#{k}".to_sym, v] }]
      options[:properties].merge!(traits)
    end
    options.delete(:traits)

    options[:properties][:trait_rails_env] = Rails.env

    if options[:user_id].blank?
      raise "user_id must be a non-blank value"
    elsif options[:event].blank?
      raise "event must be a non-blank string"
    end

    Analytics::TrackEventJob.perform_async(options)
  end

  # track_traits() tracks traits of a user. It's a thin wrapper around
  # segment io's identify: https://segment.io/libraries/ruby#identify
  #
  # For example, when a user's email changes, you can do
  # Analytics.track_traits("1234...", {email: "new_email@example.com"})
  def self.track_traits(analytics_id, traits, options={})
    options = {
      user_id: analytics_id,
      traits: traits,
      timestamp: Time.now,
      context: {}
    }.merge(options)

    options[:traits][:rails_env] = Rails.env

    if options[:user_id].blank?
      raise "user_id must be a non-blank value"
    end

    Analytics::TrackTraitsJob.perform_async(options)
  end
end
