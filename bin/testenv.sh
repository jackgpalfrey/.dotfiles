#! /usr/bin/env bash
docker build . --tag dotfiles;
docker run --mount src=/home/jack/.dotfiles,target=/home/jack/.dotfiles,type=bind,readonly -itu 0 dotfiles bash
