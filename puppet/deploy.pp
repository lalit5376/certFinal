class dockerwar::deploy {
file {'/home/slave/docker':
ensure => directory,
mode => '0777'
}
file {'/home/slave/docker/target':
ensure => directory,
mode => '0777'
}
file {'/home/slave/docker/target/calculator.war':
mode => '0777',
source => "puppet:///modules/dockerwar/calculator.war"
}
file {'/home/slave/docker/Dockerfile':
mode => '0777',
source => "puppet:///modules/dockerwar/Dockerfile"
}
exec {'Docker build':
cwd => '/home/slave/docker/',
command => '/usr/bin/docker build -t calculatorwithwar .'
}
exec {'Docker rm':
cwd => '/home/slave/docker/',
command => '/usr/bin/docker rm --force calculator8888 || echo'
}
exec {'Docker run':
cwd => '/home/slave/docker/',
command => '/usr/bin/docker run -d -p 7777:8080 --name=calculator8888 calculatorwithwar'
}
}
