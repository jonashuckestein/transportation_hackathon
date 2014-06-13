AnalyticsRuby.init({
    secret: ENV["SEGMENTIO_WRITE_KEY"],
    on_error: Proc.new { |status, msg| print msg }  # TODO Hook up error tracking
})
