class func {

	package {"func":
		ensure => "installed",
	}

	file { "/etc/func/minion.conf":
		path => "/etc/func/minion.conf",	
		content => template("minion.conf.erb"),	
		ensure => present,
		require => Package["func"],
	}

	file { "/etc/func/minion-acl.d/all.acl":
		path => "/etc/func/minion-acl.d/all.acl",	
		content => template("all.acl.erb"),	
		ensure => present,
		require => Package["func"],
	}

	file { "/etc/func/async_methods.conf":
		owner   => root,
		group   => root,
		mode    => 644,
		source  => "puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/func/async_methods.conf",
		require => Package["func"],
	}

 	service { funcd:
            	ensure   => true,
             	enable   => true,
             	require  => Package["func"],
		subscribe => [ Package["func"], File["/etc/func/minion.conf"] ],
         }
}
