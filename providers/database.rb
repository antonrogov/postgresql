action :create do
  execute "create postgresql database #{new_resource.name}" do
    command %[psql -U postgres -c "create database #{new_resource.name}"]
    not_if { `psql -U postgres -c "select * from pg_database where datname='#{new_resource.name}'"|wc -l`.chomp.to_i == 5 }
  end
end

action :drop do
  execute "drop postgresql database #{new_resource.name}" do
    command %[psql -U postgres -c "drop database #{new_resource.name}"]
    not_if { `psql -U postgres -c "select * from pg_database where datname='#{new_resource.name}'"|wc -l`.chomp.to_i == 4 }
  end
end
