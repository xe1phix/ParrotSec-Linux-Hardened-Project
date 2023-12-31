# This file is overwritten during software install.
# Persistent customizations should go in a .local file.
include disable-interpreters.local

# Lua
blacklist ${PATH}/lua*
blacklist /usr/include/lua*
blacklist /usr/lib/lua
blacklist /usr/share/lua

# Node.js
blacklist ${PATH}/node
blacklist /usr/include/node

# nvm
blacklist ${HOME}/.nvm

# Perl
blacklist ${PATH}/cpan*
blacklist ${PATH}/core_perl
blacklist ${PATH}/perl
blacklist /usr/lib/perl*
blacklist /usr/share/perl*

# PHP
blacklist ${PATH}/php*
blacklist /usr/lib/php*
blacklist /usr/share/php*/usr/lib/wine/

# Ruby
blacklist ${PATH}/ruby
blacklist /usr/lib/ruby

# Programs using python: deluge, firefox addons, filezilla, cherrytree, xchat, hexchat, libreoffice, scribus
# Python 2
blacklist ${PATH}/python2*
blacklist /usr/include/python2*
blacklist /usr/lib/python2*
blacklist /usr/local/lib/python2*
blacklist /usr/share/python2*

# You will want to add noblacklist for python3 stuff in the firefox and/or chromium profiles if you use the Gnome connector (see Issue #2026)

# Python 3
blacklist ${PATH}/python3*
blacklist /usr/include/python3*
blacklist /usr/lib/python3*
blacklist /usr/local/lib/python3*
blacklist /usr/share/python3*


## blacklist /usr/lib/cmake/

## Wine
blacklist /usr/lib/wine/
blacklist /usr/lib/wine/wineserver32
blacklist /usr/lib/wine/wine





