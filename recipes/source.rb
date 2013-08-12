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
