#!/usr/bin/env bash

install -D -m755 crack /usr/bin/crack
install -D -m755 crawler-dicionarioinformal /usr/bin/crawler-dicionarioinformal
install -D -m755 crawler-dictionary /usr/bin/crawler-dictionary
install -D -m755 handshake /usr/bin/handshake
install -D -m755 wordlist /usr/bin/wordlist

# Install john config with custom rules
install -D -m644 john.conf.custom /etc/john/john.conf.custom
