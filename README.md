# README  

## What is PostChat  
This web application gives you a experience to have chat with someone.  
You can POST, EDIT, CONFIRM, and DELETE.

## Dependency  
ruby : 2.2.2 or more  
Rails : 5.1 or more  
VirtualBox : 5.2  
Vagrant 2.1.2

## Setup  
First, install rails  
'$ gem install rails -v 5.1.1'  

Then, change directory to postchat  
'$ cd postchat'  

And install gem packages  
'$ bundle install'  

Install postgresql  
'$ sudo apt-get install postgresql'  

Create ubuntu user  
'$ sudo -u postgres psql'  
'postgres=# CREATE USER ubuntu SUPERUSER;'  
'postgres=# \q'

Set database  
'$ rails db:create'  
'$ rails db:migrate'  

Start the rails server!  
'$ rails server'

## Authors  
Ren Kataoka(University of Tsukuba)  

## References
https://railstutorial.jp/  
Renosy Scholarship by GA technologies
