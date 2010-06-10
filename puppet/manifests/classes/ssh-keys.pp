class ssh-keys {

	sshkey { 'root':
        	host_aliases  => [ 'svn', 'cvs', 'git'],
        	type   => 'ssh-rsa',
        	key    => 'X_X',
		ensure => present,
	}
}
