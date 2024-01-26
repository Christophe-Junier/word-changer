# crontab -r
# whenever --update-crontab
# whenever --update-crontab --set environment='development'
env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']

set :output, './log/cron.log'

every 1.minutes do
  runner 'puts Time.now'
  runner 'puts Rails.env'
  runner 'UpdateTextsWordJob.perform_now'
end

