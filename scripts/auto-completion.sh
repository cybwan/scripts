#!/bin/bash

cat >> ~/.bashrc <<EOF
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
#Enabling tab-completion
complete -cf sudo
complete -cf man
EOF

cat >> /etc/inputrc <<EOF
# do not show hidden files in the list
set match-hidden-files off

# auto complete ignoring case
set show-all-if-ambiguous on
set completion-ignore-case on

"\e[A": history-search-backward
"\e[B": history-search-forward
EOF