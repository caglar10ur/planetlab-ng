class issue {

	file { '/etc/issue':
		owner   => root,
		group   => root,
		mode    => 644,
		source  => 'puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/issue',
	}
}
