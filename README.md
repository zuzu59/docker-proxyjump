# docker-sshserver
Petit bac à sable pour se faire un petit proxyjump ssh
zf201025.1901


# Buts
Parfois, on aimerait pouvoir accéder à une machine Linux, depuis Internet, qui se trouve derrière un NAT sans devoir modifier la configuration du NAT.

Ce petit proxyjump va nous permettre de le faire !


# Problématiques
On peut normalement facilement créer un tunnel *ssh reverse* sur une machine Linux qui se trouve sur Internet pour le faire, mais, des fois, on ne veut pas donner l'accès de cette machine à l'utilisateur de la machine Linux cachée derrière le NAT pour des raisons de sécurité !

Ce petit serveur Proxyjump va nous permettre de *confiner* l'utilisateur dans un bac à sable utilisé seulement pour la création du tunnel *ssh reverse*.


# Moyens
On va créer un bac à sable *serveur SSH* dans un *container* Docker, et c'est ce container qui va faire office de *bac à sable de confinement* sans mettre en danger la machine Linux connectée sur Internet.


## Installation
Simplement faire:
```
git clone https://github.com/zuzu59/docker-proxyjump.git
cd docker-proxyjump
```


### Démarrer
On démarre le proxyjump serveur simplement avec:
```
./start.sh
```


### Arrêter
On arrête le proxyjump serveur simplement avec:
```
./stop.sh
```


### Purger
On peut purger toute la partie Docker avec:
```
./purge.sh
```


## Utilisation
Il faudra créer un tunnel ssh reverse montant, sur le Proxyjump, depuis la machine cachée derrière le NAT, puis un autre tunnel descendant, depuis le Proxyjump, sur sa machine et enfin se connecter via en ssh sur le port local de sa machine qui est l'image de la machine cachée derrière le NAT !

### Création du tunnel ssh reverse montant
Sur la machine cachée derrière le NAT:
```
ssh -N -R 2022:localhost:22 toto@machine_sur_internet -p 2222
```
ATTENTION, rien ne sera affiché sur le terminal !

Pour arrêter le tunnel ssh reverse, simplement un CTRL+C

### Création du tunnel ssh forward descendant
Sur sa machine:
```
ssh -N -L 2022:localhost:2022 toto@machine_sur_internet -p 2222
```

ATTENTION, rien ne sera affiché sur le terminal !

Pour arrêter le tunnel ssh reverse, simplement un CTRL+C

Puis dans un autre terminal sur sa machine:
```
ssh user_machine_nat@localhost -p 2022
```


# source: 
https://hub.docker.com/r/linuxserver/openssh-server
https://blog.linuxserver.io/2019/09/14/customizing-our-containers/

