include Cdh::Api
include Cdh::Cluster

def whyrun_supported?
  true
end

def load_current_resource
  @current_resource = Chef::Resource::resource_for_node(:cdh_cluster, node).new(@new_resource.name)
  @current_resource.name(@new_resource.name)

  if cluster_exists?(@current_resource.name)
    @current_resource.exists = true
  end
end

action :create do
  if @current_resource.exists
    Chef::Log.info "#{ @new_resource } already exists"
  else
    converge_by("Create #{ @new_resource } cluster.") do
      create_cluster(@new_resource.name)
    end
  end
end

