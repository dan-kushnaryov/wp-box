# Author: Nickolay U. Kofanov
# Company: CodeTiburon
# Date: 2015-02-25

# Name of the role should match the name of the file
name "wordpress"
description "WordPress server role"

override_attributes(
    :apache => {
      :user         => 'vagrant',
      :group        => 'vagrant',
      :mpm          => 'prefork',
      :listen_ports => ['80', '443']
    },
    :php => {
      :install_method => 'package',
      :directives => {
          'default_charset'            => 'UTF-8',
          'mbstring.language'          => 'neutral',
          'mbstring.internal_encoding' => 'UTF-8',
          'date.timezone'              => 'UTC',
          'short_open_tag'             => 'Off',
          'session.save_path'          => '/tmp'
      }
    },
    :mysql => {
      :bind_address => '0.0.0.0',
    }
)

run_list(
    "recipe[apt]",
    "recipe[build-essential]",
    "recipe[iptables]",
    "recipe[ctwp]"
)