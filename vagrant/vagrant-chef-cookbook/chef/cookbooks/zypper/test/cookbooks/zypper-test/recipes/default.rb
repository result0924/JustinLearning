include_recipe 'zypper'

zypper_repo 'remove_dvd_repo' do
  action :remove
  repo_name 'SLES11SP3-x64 DVD1 Online'
end

zypper_repo 'add_dvd_repo' do
  repo_name 'SLES11SP3-x64 DVD1 Online'
  uri 'http://demeter.uni-regensburg.de/SLES11SP3-x64/DVD1/'
end

zypper_repo 'jenkins' do
  key 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
  uri 'http://pkg.jenkins-ci.org/opensuse/'
end

zypper_repo 'add_dvd_repo_high_priority' do
  repo_name 'SLES11SP3-x64 DVD2 Online'
  uri 'http://demeter.uni-regensburg.de/SLES11SP3-x64/DVD2/'
  priority 10
end
