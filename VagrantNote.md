# Vagrant Note

## Refer
- vagrant (https://www.vagrantup.com/)
- [How to install Ruby on Rails with rbenv on Ubuntu] (https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-16-04)
- vagrant and chef git tutorial
    - https://github.com/w8s/flask_api_sample

## Note
- Vagrant box's path `~/.vagrant.d/boxes`

// you can choice your os in this
- [Vagrant cloud] (https://app.vagrantup.com/boxes/search)

// how to add a box in your vagrant
```
$ vagrant box add {your box} {downloat url}
```

## install Ubuntu

1. add box in vagrant 
```
vagrant box add https://app.vagrantup.com/sixlive/boxes/tjay-ubuntu-12-php-53
```

2. list your box
```
vagrant box list
```

3. init you box and will add Vagrantfile
- Vagrantfile will a line show `config.vm.box = "sixlive/tjay-ubuntu-12-php-53"`
```
vagrant init sixlive/tjay-ubuntu-12-php-53
```

4. start vagrant
```
vagrant up
```

5. check vagrant status
```
vagrant status
```

6. ssh your VM
```
vagrant ssh
```

7. install your software
### Pre-requisites
```
sudo apt-get autoclean
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -u dist-upgrade

sudo dpkg --configure -a
sudo apt-get -f install
```
```
sudo apt-get --no-install-recommends -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev libgdbm-dev ncurses-dev automake libtool bison subversion pkg-config libffi-dev vim libc6 libc6-dev libc6-dbg
```

### install rbenv
clone the rbenv repository from git. 
You should complete these steps from the user account from which you plan to run Ruby.
```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```
From here, you should add ~/.rbenv/bin to your $PATH so that you can use rbenv's command line utility. 
Also adding ~/.rbenv/bin/rbenv init to your ~/.bash_profile will let you load rbenv automatically.
```
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
```
```
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
```
Next, source rbenv by typing
```
source ~/.bashrc
```
You can check to see if rbenv was set up properly by using the type command, which will display more information about rbenv:
```
type rbenv
```
your terminal window should output the following:
```
rbenv is a function
rbenv () 
{ 
    local command;
    command="$1";
    if [ "$#" -gt 0 ]; then
        shift;
    fi;
    case "$command" in 
        rehash | shell)
            eval "$(rbenv "sh-$command" "$@")"
        ;;
        *)
            command rbenv "$command" "$@"
        ;;
    esac
}
```
In order to use the rbenv install command, which simplifiles the installation process for new versions or Ruby, 
you should install ruby-build, which we will install as a plugin for rbenv through git:
```
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```
At this point, you should have both rbenv and ruby-build installed, and we can move on to installing Ruby.

### install ruby
with the ruby-build rbenv plugin now installed, we can install whatever versions of Ruby that we may need through a simple command. First, let's list all the avaliable versions of Ruby:
```
rbenv install -l
```
The output of that command should be a long list of versions that you can choose to install

We'll now install a particular version of Ruby.
It's important to keep in mind that installing Ruby can be a lengthy process, so be prepared for the installation to take some time to complete.

As an example here, let's install Ruby version `2.4.2`, and once it's done installing, we can set it as our default version with the global sub-command:
```
rbenv install 2.4.2
```
```
rbenv global 2.4.2
```
If you would like to install and use a different version, simply run the rbenv commands with a different version number, as `rbenv install 2.5.0` and `rbenv global 2.5.0`

Verify that Ruby was properly installed by checking your version number:
```
ruby -v
```

### install chef solo
- download chef solo
```
# from https://downloads.chef.io

wget https://packages.chef.io/files/stable/chef/13.6.4/ubuntu/14.04/chef_13.6.4-1_amd64.deb
```

- install chef solo
```
sudo dpkg -i chef_13.6.4-1_amd64.deb
```

### install chef server
- download chef server
```
wget https://packages.chef.io/files/stable/chef-server/12.17.5/ubuntu/14.04/chef-server-core_12.17.5-1_amd64.deb
```

- install chef server
```
sudo dpkg -i chef-server-core_12.17.5-1_amd64.deb
```

- reconfig chef server
```
vagrant@tjay:~$ sudo chef-server-ctl reconfigure
/opt/opscode/embedded/bin/ruby: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.17' not found (required by /opt/opscode/embedded/lib/libruby.so.2.2)
```
oh no... has error
```
wget http://launchpadlibrarian.net/130794928/libc6_2.17-0ubuntu4_amd64.deb
```
```
sudo dpkg -i ipts libc6_2.17-0ubuntu4_amd64.deb
```
run again
```
vagrant@tjay:~$ sudo chef-server-ctl reconfigure
```
and you will see
```
Chef Client finished, 492/1082 resources updated in 09 minutes 30 seconds
Chef Server Reconfigured!
```

- install chfDK
```
curl -s https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk
```

- two host in vagrant(https://github.com/xiaopeng163/docker-k8s-lab/blob/master/lab/k8s/multi-node/vagrant/Vagrantfile)

- how to remove vagrant
    1. vagrant halt
    2. vagrant destory
    3. rm .vagrant
    4. vagrant box remove `box_name`
