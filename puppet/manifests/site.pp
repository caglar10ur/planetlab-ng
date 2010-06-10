import 'classes/*'

node default {
	include func
	include puppet
	include ssh-keys
	include strace
	include cronjob
	include wget
}

node 'pl-virtual-16.CS.Princeton.EDU' inherits default {
	include lsof
}

node 'pl-virtual-17.CS.Princeton.EDU' inherits default {
	include lsof
}

node 'pl-virtual-18.CS.Princeton.EDU' inherits default {
	include lsof
}

node 'planetlab-02.cs.princeton.edu' {
	include strace
	include func
	include puppet

	# Conf Files
	include sudoers
	include ntp
	include sshd
	include issue
	include yum
	include gpg
}
