#!/bin/bash

cd ~
git clone https://github.com/plexus/dotfiles
git clone https://github.com/plexus/chemacs

mkdir emacs-profiles

cd dotfiles/
./connect-the-dots

cd ~/emacs-profiles/
git clone https://github.com/syl20bnr/spacemacs -b develop spacemacs-develop
git clone https://github.com/lambdaisland/.spacemacs.d lambdaisland

cd ~/chemacs
./install.sh

cd /tmp
curl -O https://download.clojure.org/install/linux-install-1.10.1.469.sh
chmod +x linux-install-1.10.1.469.sh
sudo ./linux-install-1.10.1.469.sh

wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken WRUtyALbD4SXouKUjpfT_47uFVjRks61kwxmwshAUo

#ssh-keygen
cat /home/dev/.ssh/id_rsa.pub

# Copy key to github
# Fix up emacs config
