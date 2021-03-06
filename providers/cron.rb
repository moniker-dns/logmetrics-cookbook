# Copyright 2013 Hewlett-Packard Development Company, L.P.
#
# Author: Kiall Mac Innes <kiall@hp.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
def whyrun_supported?
  false
end

action :add do
  clean_name = new_resource.log_file.gsub(/\//, '_')
  target = new_resource.target
  parser = new_resource.parser
  command = new_resource.command

  options = new_resource.options
  options_string = ""

  options.each do |key, value|
    options_string += " --#{key} #{value}"
  end

  cron "logmetrics-#{clean_name}-#{target}-#{parser}" do
    command "#{command} #{target} #{parser} #{new_resource.log_file} #{options_string}"
    action :create
  end
end

action :remove do
  clean_name = new_resource.log_file.gsub(/\//, '_')
  target = new_resource.target
  parser = new_resource.parser

  cron "logmetrics-#{clean_name}-#{target}-#{parser}" do
    action :delete
  end
end
