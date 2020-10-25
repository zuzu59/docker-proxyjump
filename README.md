# docker-sshserver
Petit bac à sable pour se faire un petit proxyjump ssh
zf201025.1815


ssh -N -R 2022:localhost:22 toto@www.proxyjump.ml -p 2222

ssh -N -L 2022:localhost:2022 toto@www.proxyjump.ml -p 2222

ssh xx@localhost -p 2022

# source: 
https://hub.docker.com/r/linuxserver/openssh-server
https://blog.linuxserver.io/2019/09/14/customizing-our-containers/

