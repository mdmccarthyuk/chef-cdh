
# Defaults for CDH6
#default['cdh']['cm']['repo'] = "https://archive.cloudera.com/cm6/6.0.0/redhat7/yum/"
#default['cdh']['cm']['repokey'] = "https://archive.cloudera.com/cm6/6.0.0/redhat7/yum/RPM-GPG-KEY-cloudera"
# Defaults for CDH5
default['cdh']['cm']['repo'] = "https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/5/"
default['cdh']['cm']['repokey'] = "https://archive.cloudera.com/cm5/redhat/7/x86_64/cm/RPM-GPG-KEY-cloudera"

# Defaults for CM6.0.x
#default['cdh']['cm']['packages'] = %w(jdk postgresql cloudera-manager-server cloudera-manager-daemons cloudera-manager-agent)
# Defaults for CM5.16.1
default['cdh']['cm']['packages'] = %w(oracle-j2sdk1.7 postgresql cloudera-manager-server cloudera-manager-daemons cloudera-manager-agent)

default['cdh']['agent']['packages'] = %w(oracle-j2sdk1.7 postgresql cloudera-manager-agent)
default['cdh']['server'] = "localhost"
default['cdh']['user'] = "admin"
default['cdh']['pass'] = "admin"

default['cdh']['db']['host'] = "localhost"
default['cdh']['db']['port'] = "5432"
default['cdh']['db']['type'] = "postgresql"
default['cdh']['db']['name'] = "cmf"
default['cdh']['db']['user'] = "cmf"
default['cdh']['db']['pass'] = "cmf"

