FROM ubuntu AS base
WORKDIR /root/.dotfiles
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

FROM base AS personal
ARG TAGS
RUN addgroup --gid 1000 jack
RUN adduser --gecos jack --uid 1000 --gid 1000 --disabled-password jack
RUN echo "jack:jack" | chpasswd
RUN apt install sudo -y
RUN echo "jack    ALL=(ALL:ALL) ALL" > /etc/sudoers
USER jack
WORKDIR /home/jack/

FROM personal
COPY . ./.dotfiles
