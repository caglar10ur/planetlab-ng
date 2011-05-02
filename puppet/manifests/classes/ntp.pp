class ntp {

	package { ntp: 
		ensure => latest 
	}

	file { "/etc/ntp.conf":
		owner   => root,
		group   => root,
		mode    => 644,
		source  => "puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/ntp.conf",
		require => Package["ntp"],
	}

 	service { ntpd:
            	ensure   => true,
             	enable   => true,
             	require  => Package["ntp"],
		subscribe => [ Package["ntp"], File["/etc/ntp.conf"] ],
         }
}
