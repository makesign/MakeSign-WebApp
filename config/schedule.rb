# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every :day, at: "11:59pm" do
  rake "slide_mappings:delete_expired"
end

#TIPS from Nikki:

# (1) you can have a look at all cron jobs by using the following command in your terminal:
#           crontab -l

# (2) you will have to use the following command to update your crontab (the file where the automations are saved):
#           whenever --update-crontab

# (3) you can use the following command to safely remove cron jobs from your crontab added by whenever:
#           whenever --clear-crontab

# (4) if you want to test your cron jobs added via whenever in an environment different than 'production',
#     you will have to use the following command:
#           whenever --update-crontab --set environment='development'
#
#     development can be changed to any viable environment
#     !important!
#       when you are ready, remember to change the environment back to 'production'
#       you can do so by:
#         [1] removing all cron jobs (siehe (3))
#         [2] updating the crontab once again (siehe (2))