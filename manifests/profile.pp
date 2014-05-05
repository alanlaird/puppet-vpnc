define vpnc::profile (
  $id,
  $gateway,
  $secret,
  $username,
  $password,
  $options = {},
  $create_init = false,
  $on_boot = false,
) {

  file {"/etc/vpnc/${name}.conf":
    ensure  => file,
    content => template('vpnc/profile.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '600',
    require => Package['vpnc'],
  }

  if $create_init {

    file { "${vpnc::params::init_path}vpnc-${name}${vpnc::params::init_append}" :
      ensure  => file,
      content => template($vpnc::params::init_template),
      mode    => '0755',
    }

    service {"vpnc-${name}":
      enable     => $onboot,
      hasrestart => $vpnc::params::hasrestart,
      hasstatus  => $vpnc::params::hasstatus,
      require    => File["${vpnc::params::init_path}vpnc-${name}${vpnc::params::init_append}"],
    }
  }

}
