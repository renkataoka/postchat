# README  

## What is PostChat  
This web application is created by reference to [Ruby on Rails Tutorial](https://railstutorial.jp/).  
This is deployed in (https://post-chat.herokuapp.com/) using heroku(https://jp.heroku.com/).

## Dependency  
ruby : 2.2.2 or more  
Rails : 5.1 or more  
VirtualBox : 5.2  
Vagrant 2.1.2

## Setup  
**To check vagrant settting, please check [Vagrantfile](/Vagrantfile).**

First, clone this repository.

Then, install gem packages
'$ bundle install'  

Install Yarn from (https://yarnpkg.com/en/docs/install#debian-stable).  
Then, install jquery and bootstrap.  
'$ yarn add jquery'  
'$ yarn add bootstrap@3'  

Install ImageMagick  
'$ sudo apt-get install imagemagick'


Install postgresql  
'$ sudo apt-get install postgresql'  

Create ubuntu user  
'$ sudo -u postgres psql'  
'postgres=# CREATE USER ubuntu SUPERUSER;'  
'postgres=# \q'

Set database  
'$ rails db:create'  
'$ rails db:migrate'  

Finally, Run test.  
'$ rails test'  

When you can pass the test, Start the rails server!  
'$ rails server'

## Authors  
Ren Kataoka(University of Tsukuba)  

## References
https://railstutorial.jp/  
Renosy Scholarship by GA technologies  
https://qiita.com/YN6127yn/items/f701474d2c0276b52bfb  
http://mochikichi.hatenablog.com/entry/2017/03/26/113022  
