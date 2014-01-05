#
# Cookbook Name:: subversion
# Recipe:: source
#
# Copyright 2013, MarkUsProject
#

include_recipe "subversion::default"

# packages needed in order to compile subversion
case node['platform']

when "debian"
  %w{ libapr1 libapr1-dev libaprutil1 libaprutil1-dev}.each do |pg_pack|
    package pg_pack
  end

end

#remote_file "#{Chef::Config[:file_cache_path]}/subversion-#{node[:subversion][:version]}.tar.gz" do
remote_file "/root/subversion-#{node[:subversion][:version]}.tar.gz" do
  source "#{node[:subversion][:download_link]}/subversion-#{node[:subversion][:version]}.tar.gz"
  action :create_if_missing
end

bash "Compile subversion #{node[:subversion][:version]}" do
  #cwd Chef::Config[:file_cache_path]
  cwd "/root"
  code <<-EOH
    tar xvzf subversion-#{node[:subversion][:version]}.tar.gz
    cd subversion-#{node[:subversion][:version]}
    ./configure --with-ruby-sitedir=#{node[:subversion][:ruby_sitedir]}
    make && make swig-rb && make install && make install-swig-rb
  EOH
  creates "/usr/local/lib/site_ruby/1.9.1/svn/client.rb"
  creates "/usr/local/lib/site_ruby/1.9.1/svn/repos.rb"
end

execute "Running ldconfig" do
  command "echo '/usr/local/lib' >> /etc/ld.so.conf && ldconfig"
  action :run
  not_if "grep '/usr/local/lib' /etc/ld.so.conf"
end
