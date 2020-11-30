#!/bin/bash

#Author Enoch Masih
#Class Linux Administration 
#Date Created 11/24/2020
#This Security script is designed to run as a cron job. 

#Assigns filename with today's date and creates log file.
time_var=$(date +'%m-%d-%Y')
filepath="/home/Security/"$time_var"Log.txt"
touch $filepath

#This command will check for last failed login into the system this week
{
echo
echo
echo Daily Report
echo
echo =============
echo Failed Login
echo =============
lastb -i -w -s yesterday -t now
echo
echo ==============================
echo "Off-Hour Login (20:00-06:00)"
echo ==============================
last -i -s 20:00 -t 06:00
echo
echo =================
echo "File Integrity"
echo =================
md5sum /var/log/messages> /home/Security/messages
md5sum -c /home/Security/messages
md5sum .bashrc> /home/Security/bashrc
md5sum -c /home/Security/bashrc


} > $filepath


