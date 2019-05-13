#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file '/etc/machine-id' do
  content 'anthony1234'
end

package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
    source 'index.html.erb'
end

template '/etc/httpd/conf/httpd.conf' do
    source 'httpd.conf.erb'
    notifies :restart, 'service[httpd]'
end

service 'httpd' do
  action [:enable, :start]
end
