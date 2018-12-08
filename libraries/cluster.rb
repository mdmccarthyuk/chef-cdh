module Cdh
  module Cluster
    include Cdh::Api
 
    def cluster_exists?(name)
      rest_call("cloudera.mm.net", :get, "http://cloudera.mm.net:7180/api/v17/clusters/#{name}").kind_of? Net::HTTPSuccess
    end
  
    def create_cluster(name)
      body = {
        :items => [ {
                    :name => name,
                    :version => "CDH5",
                    :displayName => name,
                    :fullVersion => "5.14.0"
                  } ]
      }.to_json
      response = rest_call("cloudera.mm.net", :post, "http://cloudera.mm.net:7180/api/v17/clusters", body)
    end

  end
end

Chef::Resource.send(:include, Cdh::Cluster)
