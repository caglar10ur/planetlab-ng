class yum {

	file { '/etc/yum.conf':
		owner   => root,
		group   => root,
		mode    => 644,
		source  => 'puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/yum.conf',
	}

	file { '/etc/yum.myplc.d/fedora.repo':
		owner   => root,
		group   => root,
		mode    => 644,
		source  => 'puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/yum.myplc.d/fedora.repo',
	}


	file { '/etc/yum.myplc.d/fedora-updates.repo':
		owner   => root,
		group   => root,
		mode    => 644,
		source  => 'puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/yum.myplc.d/fedora-updates.repo',
	}

	file { '/etc/yum.myplc.d/myplc.repo':
		owner   => root,
		group   => root,
		mode    => 644,
		source  => 'puppet://pl-virtual-16.CS.Princeton.EDU/files/etc/yum.myplc.d/myplc.repo',
	}

	file { '/etc/yum.myplc.d/stock.repo':
		ensure   => absent,
	}

}
