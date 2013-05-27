class wakanda_solution {
    package {'git':
        ensure => present
    }
    vcsrepo {'/usr/src/solution':
        require => Package['git'],
        source => $git_repository_url,
        ensure => present,
        provider => git
    }
    class {'wakanda':
        require => Vcsrepo['/usr/src/solution'],
        solution_path => "/usr/src/solution/$relative_solution_path"
    }
}