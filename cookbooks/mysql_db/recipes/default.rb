bash "create a mysql database using chef" do

#check if a db already exists
not_if("/usr/bin/mysql -uroot -ptest -e'show databases' | grep #{node[:mysql_db][:db_name]}", :user=>'root')

#run as user
user "root"

# a heredoc of the code to execute, note the node hash is created from the JSON file
code <<-HEY_EOM
mysql -uroot -ptest -e 'create database #{node[:mysql_db][:db_name]}'
HEY_EOM

end
