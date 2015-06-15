
# README.txt
=============

## Prerequisits:

You need to install OracleVM for this script to work and also Vagrant.

I'm assuming you want to work with BitBucket. If not, adjust your script accordingly.

So you're using Windows and you've decided to automate your rails-on-linux installation process? Good for you. Hopefully this project will save a lot of hair-tearng and pain for you...

This is a relatively simple ruby on rails installer for vagrant / Oracle VM.

Once you've downloaded this using git clone, you'll need to make a few minor tweeks (it will not work just out of the box):

## In Vagrantfile:

Replace 'oranges465' with whatever password you want to use for your server.
NOTE: using the above as-is is HIGHLY INSECURE for you - change the password!

I haven't scripted the downloading of public keys. Instead, I've included them in this project. Why? Becuase that's more secure than downloading them each and every time you run this script. Of course, if you don't trust me, you should download and use your own coppies as follows (in fact I recomend this):

- For RVM:
curl -#LO https://rvm.io/mpapis.asc

- For BitBucket:
ssh-keyscan -t rsa,dsa bitbucket.org

These keys need to go in the directory 'supporting', named mpapis.asc and bitbucket_keys respectively.

Make sure you've set up BitBucket properly to accept connections via SSH, see:

https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git#SetupSSHforGit-step-4-ssh-for-git

Add your private key for bit bucket to the supporting directory with the name: ssh-for-bitbucket

After running the script with Vagrant up, log in and clone your repo.

Vagrant ssh

git clone ...etc.


Any questions? Ask away but I'm fairly new to this, so I don't know how much help I'll be. Please be sure to google the crap out of your question first!

