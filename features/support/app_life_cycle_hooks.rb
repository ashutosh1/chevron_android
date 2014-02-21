require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
  start_test_server_in_background
end
# Before('@first') do |scenario|
#   start_test_server_in_background
# end

# Before('~@first') do |scenario|
#   q = query("ImageButton")
#   touch(q) unless q.nil?
# end

After do |scenario|
  if scenario.failed?
    screenshot_embed
  end
  shutdown_test_server
end

# at_exit do
#   shutdown_test_server
# end

