#!/bin/bash

if ! test -f /usr/bin/reposync ; then #if statement to make sure the reposync package is installed
       yum -y install reposync
fi

if ! test -f /usr/bin/createrepo ; then #if statement to make sure the create repo package is installed
        yum -y install createrepo
fi

mkdir -p /var/repo/ #makes a directory for the repos if it does not exist
reposync --gpgcheck --newest-only --repoid=baseos --destdir=/var/repo --downloadcomps #Mirrors the baseos repo to /var/repo
createrepo /var/repo/baseos #creates the necessary files for the repo to work

reposync --gpgcheck --newest-only --repoid=appstream --destdir=/var/repo --downloadcomps #Mirrors the appstream repo to /var/repo
createrepo /var/repo/appstream

reposync --gpgcheck --newest-only --repoid=extras --destdir=/var/repo --downloadcomps #Mirrors the extras repo to /var/repo
createrepo /var/repo/extras

reposync --gpgcheck --newest-only --repoid=powertools --destdir=/var/repo --downloadcomps #Mirrors the powertools repo to /var/repo
createrepo /var/repo/powertools

reposync --gpgcheck --newest-only --repoid=epel --destdir=/var/repo --downloadcomps #Mirrors the epel repo to /var/repo
createrepo /var/repo/epel
