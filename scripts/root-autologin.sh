#!/bin/bash

sudo sed -i 's/^auth\trequired\tpam_succeed_if.so user != root quiet_success/#auth\trequired\tpam_succeed_if.so user != root quiet_success/g' /etc/pam.d/gdm-autologin
sudo sed -i 's/^auth\trequired\tpam_succeed_if.so user != root quiet_success/#auth\trequired\tpam_succeed_if.so user != root quiet_success/g' /etc/pam.d/gdm-password
sudo sed -i 's#^mesg n 2> \/dev\/null || true#tty -s\&\&mesg n \|\| true#g' /root/.profile
sudo sed -i 's/^AutomaticLogin=.*/AutomaticLogin=root/g' /etc/gdm3/custom.conf
sudo sed -i 's/#  TimedLoginEnable = true/TimedLoginEnable = true/g' /etc/gdm3/custom.conf
sudo sed -i 's/#  TimedLogin = .*/TimedLogin = root/g' /etc/gdm3/custom.conf
sudo sed -i 's/#  TimedLoginDelay = 10/TimedLoginDelay = 10/g' /etc/gdm3/custom.conf