every 1.minutes do
 runner "UpdateTextsWordJob.perform_now", environment => "development"
end

