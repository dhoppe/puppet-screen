class screen {
  file { '/etc/screenrc':
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/screen/common/etc/screenrc',
    require => Package['screen'],
  }

  package { 'screen':
    ensure => present,
  }
}