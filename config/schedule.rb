# crontab -r
# whenever --update-crontab
# whenever --update-crontab --set environment='development'

set :output, './log/cron.log'

every 1.minutes do
  runner 'puts Time.now'
  runner 'puts Rails.env'
  runner 'UpdateTextsWordJob.perform_now'
end

