action :create do
  execute "create postgresql user #{new_resource.name}" do
    command %[psql -U postgres -c "create user #{new_resource.name} with password '#{new_resource.password}'"]
    not_if { `psql -U postgres -c "select * from pg_user where usename='#{new_resource.name}'"|wc -l`.chomp.to_i == 5 }
  end
end

action :drop do
  execute "drop postgresql user #{new_resource.name}" do
    command %[psql -U postgres -c "drop user #{new_resource.name}"]
    not_if { `psql -U postgres -c "select * from pg_user where usename='#{new_resource.name}'"|wc -l`.chomp.to_i == 4 }
  end
end
