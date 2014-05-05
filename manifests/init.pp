# Class: vpnc
#
# This module manages vpnc
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class vpnc inherits vpnc::params {

    package { "vpnc":
        ensure    => present
    }

}
