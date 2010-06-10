class sshd {

	package { openssh-server: 
		ensure => latest 
	}

	file { '/etc/ssh/sshd_config':
		owner   => root,
		group   => root,
		mode    => 600,
		source  => 'puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/ssh/sshd_config',
		require => Package['openssh-server'],
	}

 	service { sshd:
            	ensure   => true,
             	enable   => true,
             	require  => Package['openssh-server'],
		subscribe => [ Package['openssh-server'], File['/etc/ssh/sshd_config'] ],
         }
}
