class sudoers {

	package { sudo: 
		ensure => latest 
	}
	
	file { '/etc/sudoers':
		owner   => root,
		group   => root,
		mode    => 440,
		source  => 'puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/sudoers',
		require => Package['sudo'],
	}
}
