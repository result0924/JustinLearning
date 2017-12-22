node.default['main']['doc_root'] = "/vagrant/db"

#install postgresql
execute "Import the repository signing key" do
  command "wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -"
end

execute "Add line to pgdb.list" do
  command "sudo sh -c 'echo \"deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main\" >> /etc/apt/sources.list.d/pgdg.list'"
end

execute "Update package sources" do
  command "sudo apt-get update"
end

execute "Install postgresql" do
  command "sudo apt-get install postgresql-9.6 -y"
end

#define the Apache service
service "postgresql" do
    action [ :enable, :start ]
end

#set postgresql.conf template
template "/etc/postgresql/9.4/main/postgresql.conf" do
    source "postgresql.conf.erb"
    action :create
    notifies :restart, resources(:service => "postgresql")
end

#set pg_hba.conf template
template "/etc/postgresql/9.4/main/pg_hba.conf" do
    source "pg_hba.conf.erb"
    action :create
    notifies :restart, resources(:service => "postgresql")
end