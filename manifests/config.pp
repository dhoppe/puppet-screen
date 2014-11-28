# == Class: screen::config
#
class screen::config {
  if $::screen::config_dir_source {
    file { 'screen.dir':
      ensure  => $::screen::config_dir_ensure,
      path    => $::screen::config_dir_path,
      force   => $::screen::config_dir_purge,
      purge   => $::screen::config_dir_purge,
      recurse => $::screen::config_dir_recurse,
      source  => $::screen::config_dir_source,
      require => $::screen::config_file_require,
    }
  }

  if $::screen::config_file_path {
    file { 'screen.conf':
      ensure  => $::screen::config_file_ensure,
      path    => $::screen::config_file_path,
      owner   => $::screen::config_file_owner,
      group   => $::screen::config_file_group,
      mode    => $::screen::config_file_mode,
      source  => $::screen::config_file_source,
      content => $::screen::config_file_content,
      require => $::screen::config_file_require,
    }
  }
}
