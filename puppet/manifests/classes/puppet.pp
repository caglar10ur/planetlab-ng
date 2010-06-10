class puppet {

	package {'puppet':
		ensure => 'installed',
	}

#	package {'augeas':
#		ensure => 'installed',
#	}

#	augeas {'puppet.conf': 
#        	context => '/files/etc/puppet/puppet.conf/', 
#        	changes => [ 'set puppetd/report true' ], 
#             	require  => Package['puppet'],
#    	} 

	file { '/etc/puppet/puppet.conf':
		owner   => root,
		group   => root,
		mode    => 644,
		source  => 'puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/puppet/puppet.conf',
		require => Package['puppet'],
	}


 	service { puppet:
            	ensure   => true,
             	enable   => true,
             	require  => Package['puppet'],
		subscribe => [ Package['puppet'], File['/etc/puppet/puppet.conf'] ],
         }
}
