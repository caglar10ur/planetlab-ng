class logrotate {

	package { logrotate:
		ensure => latest,
	}

	file { '/etc/logrotate.conf':
		owner   => root,
		group   => root,
		mode    => 644,
		source  => 'puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/logrotate.conf',
		require => Package[logrotate],
	}
}
