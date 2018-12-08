#
# Cookbook:: cdh
# Recipe:: hue
#
# Copyright:: 2018, The Authors, All Rights Reserved.

%w(epel-release python-pip).each { |rpm| package rpm }

execute 'pip psycopg' do
	command 'pip install psycopg2==2.7.5 --ignore-installed'  
end

