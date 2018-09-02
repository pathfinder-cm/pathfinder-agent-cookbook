#
# Cookbook:: pathfinder-agent
# Attribute:: default
#
# Copyright:: 2018, Pathfinder CM.
#
#

cookbook_name = 'pathfinder-agent'

# User and group of service process
override[cookbook_name]['user'] = 'root'
override[cookbook_name]['group'] = 'root'

# Installation directory
default[cookbook_name]['prefix_root'] = '/opt'
# Where to link binaries
default[cookbook_name]['prefix_bin'] = '/opt/bin'
# Temp directory
default[cookbook_name]['prefix_temp'] = '/var/cache/chef'

# Agent version
default[cookbook_name]['version'] = '0.1.0'
agent_version = node[cookbook_name]['version']

# Where to get the binary
default[cookbook_name]['binary'] = 'pathfinder-agent-linux'
agent_binary = node[cookbook_name]['binary']
default[cookbook_name]['mirror'] =
  "https://github.com/pathfinder-cm/pathfinder-agent/releases/download/#{agent_version}/#{agent_binary}"
default[cookbook_name]['service_name'] = 'pathfinder-agent'

# Environment variables
default[cookbook_name]['prefix_env_vars'] = '/etc/default'
default[cookbook_name]['env_vars_file'] = "#{node[cookbook_name]['prefix_env_vars']}/#{node[cookbook_name]['service_name']}"
default[cookbook_name]['env_vars'] = {}

# Agent daemon options, used to create the ExecStart option in service
default[cookbook_name]['cli_opts'] = ['-V']

# Log file location
default[cookbook_name]['prefix_log'] = '/var/log/pathfinder-agent'
default[cookbook_name]['log_file_name'] = 'agent.log'

# Agent Systemd service unit, include config
default[cookbook_name]['systemd_unit'] = {
  'Unit' => {
    'Description' => 'pathfinder agent',
    'After' => 'network.target'
  },
  'Service' => {
    'Type' => 'simple',
    'User' => node[cookbook_name]['user'],
    'Group' => node[cookbook_name]['group'],
    'Restart' => 'on-failure',
    'RestartSec' => 2,
    'StartLimitInterval' => 50,
    'StartLimitBurst' => 10,
    'ExecStart' => 'TO_BE_COMPLETED'
  },
  'Install' => {
    'WantedBy' => 'multi-user.target'
  }
}
