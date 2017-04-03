#!/bin/sh
set -e
if [[ -z ${LOG_LEVEL} ]]
then
    LOG_LEVEL="ERROR"
fi
if [[ -z ${ECS_CLUSTER} ]]
then
    ECS_CLUSTER="default"
fi
if [[ -z ${ECS_REGION} ]]
then
    ECS_REGION="us-east-1"
fi
if [[ -z ${ECS_DOMAIN} ]]
then
    ECS_DOMAIN="ecs.localhost"
fi
if [[ -z ${ECS_WATCH_CHANGES} ]]
then
    ECS_WATCH_CHANGES="true"
fi
if [[ -z ${ECS_REFRESH_SECONDS} ]]
then
    ECS_REFRESH_SECONDS=15
fi
if [[ -z ${ECS_EXPOSED} ]]
then
    ECS_EXPOSED="false"
fi

sed -i "s/log-level/${LOG_LEVEL}/" /etc/traefik/traefik.toml
sed -i "s/ecs-cluster-name/${ECS_CLUSTER}/" /etc/traefik/traefik.toml
sed -i "s/ecs-cluster-region/${ECS_REGION}/" /etc/traefik/traefik.toml
sed -i "s/ecs-cluster-domain/${ECS_DOMAIN}/" /etc/traefik/traefik.toml
sed -i "s/ecs-watch-changes/${ECS_WATCH_CHANGES}/" /etc/traefik/traefik.toml
sed -i "s/ecs-refresh-seconds/${ECS_REFRESH_SECONDS}/" /etc/traefik/traefik.toml
sed -i "s/ecs-exposed-by-default/${ECS_EXPOSED}/" /etc/traefik/traefik.toml

exec "$@"
