class vpnc::params {

  case $operatingsystem {
    'Ubuntu': {
      $init_path = '/etc/init/'
      $init_append = '.conf'
      $init_template = 'vpnc/upstartscript.erb'
      $hasrestart = true
      $hasstatus  = true
    }
    'default': {
      $init_path = '/etc/init.d/'
      $init_append = ''
      $init_template = 'vpnc/initscript.erb'
      $hasrestart = false
      $hasstatus  = false
    }
  }
}


