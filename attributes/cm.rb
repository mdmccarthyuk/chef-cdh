
default['cdh']['cm']['repo'] = "https://archive.cloudera.com/cm6/6.0.0/redhat7/yum/"
default['cdh']['cm']['repokey'] = "https://archive.cloudera.com/cm6/6.0.0/redhat7/yum/RPM-GPG-KEY-cloudera"
default['cdh']['cm']['packages'] = %w(oracle-j2sdk1.8 postgresql cloudera-manager-server cloudera-manager-daemons cloudera-manager-agent)
default['cdh']['agent']['packages'] = %w(oracle-j2sdk1.8 postgresql cloudera-manager-agent)
default['cdh']['server'] = "localhost"
default['cdh']['user'] = "admin"
default['cdh']['pass'] = "admin"

