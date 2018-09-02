#
# Cookbook:: pathfinder-agent
# Recipe:: default
#
# Copyright:: 2018, Pathfinder CM.
#
#

service_name = node[cookbook_name]['service_name']

pathfinder_agent_binary_install service_name do
  version node[cookbook_name]['version']
  prefix_root node[cookbook_name]['prefix_root']
  prefix_bin node[cookbook_name]['prefix_bin']
  prefix_temp node[cookbook_name]['prefix_temp']
  mirror node[cookbook_name]['mirror']
  user node[cookbook_name]['user']
  group node[cookbook_name]['group']
end

bin = "#{node[cookbook_name]['prefix_bin']}/#{service_name}"
pathfinder_agent_binary_systemd service_name do
  cli_opts node[cookbook_name]['cli_opts']
  unit node[cookbook_name]['systemd_unit']
  bin bin
  env_vars_file env_vars_file
  prefix_log node[cookbook_name]['prefix_log']
  log_file_name node[cookbook_name]['log_file_name']
end
