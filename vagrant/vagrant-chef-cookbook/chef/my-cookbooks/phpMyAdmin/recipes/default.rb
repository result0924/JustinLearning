execute "Update package sources" do
    command "sudo apt-get update"
end

execute "Install phpMyAdmin" do
    command "sudo apt-get install phpmyadmin -y"
end