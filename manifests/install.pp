# == Class: screen::install
#
class screen::install {
  if $::screen::package_name {
    package { 'screen':
      ensure => $::screen::package_ensure,
      name   => $::screen::package_name,
    }
  }

  if $::screen::package_list {
    ensure_resource('package', $::screen::package_list, { 'ensure' => $::screen::package_ensure })
  }
}
