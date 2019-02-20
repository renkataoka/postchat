# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network :"forwarded_port", guest: 3000, host: 3000
  config.vm.synced_folder "~/workspace", "/home/ubuntu/workspace", :create => true, mount_options: ['dmode=777','fmode=755']
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    #ape-getを更新
    sudo apt-get -y upgrade
    sudo apt-get -y update

    #周辺ライブラリをインストール
    sudo apt-get install git curl g++ make vim nodejs libreadline-dev libssl-dev zlib1g-dev imagemagick libmagickcore-dev libmagickwand-dev -y
    sudo apt-get remove ruby -y
    git clone git://github.com/rbenv/rbenv.git /home/ubuntu/.rbenv

    #rbenvの初期化
    echo 'export PATH="/home/ubuntu/.rbenv/bin:$PATH"' >> /home/ubuntu/.profile
    echo 'eval "$(rbenv init -)"' >> /home/ubuntu/.profile
    . /home/ubuntu/.profile

    #ruby-buildをインストール
    mkdir -p /home/ubuntu/.rbenv/plugins
    git clone git://github.com/rbenv/ruby-build.git /home/ubuntu/.rbenv/plugins/ruby-build

    #rubyをインストール
    rbenv install 2.3.0
    rbenv global 2.3.0
    rbenv rehash
    sudo apt-get install ruby-railties -y

    #bundleをインストール
    gem install bundler --no-document

    #postgresqlをインストール
    sudo apt-get install postgresql postgresql-contrib python-psycopg2 libpq-dev -y
  SHELL
end
