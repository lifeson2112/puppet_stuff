class mynewclass {
  # Intentionally left blank
}


define mynewclass::edit_config_file (
  $file_name,
  $line_val,
  $line_match,
){

  file_line {"${file_name}_${$name}":
    ensure => present,
    path   => $file_name,
    line   => $line_val,
    match  => $line_match,
  }

}

node default {
  class { "mynewclass": }

  $defaults = {
    file_name => '/root/myconf.conf'
  }

  $setting_1_val = hiera('setting_1_val', 'default_value')

  $configs = {
    setting1 => {
      line_match => '^setting1 .*',
      line_val => "setting1 ${setting_1_val}"
    },
    setting2 => {
      line_match => '^setting2 .*',
      line_val => 'setting2 njiegj'
    },
    setting3 => {
      line_match => '^setting3 .*',
      line_val => 'setting3 agq3g'
    },
  }

  create_resources(::mynewclass::edit_config_file, $configs, $defaults)

}
