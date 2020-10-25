#!/bin/bash
#Petit script pour arrêter le binz et tout effacer volumes ET images comprises
#zf201025.1626
# source: https://docs.docker.com/compose/reference/up

docker-compose down --volumes --remove-orphans --rmi all
