# Install the logmetrics package
include_recipe "logmetrics"

# Install a cronjob to parse a log every minute
logmetrics_cron "/tmp/access.log" do
  target   "stdout"
  parser   "nginx-status"
  options  :foo => false, :bar => true, :baz => "baz"

  action   :add
end
