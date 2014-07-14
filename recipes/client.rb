case node['platform_family']
when "debian"
  include_recipe "postgresql::client_debian"
end
