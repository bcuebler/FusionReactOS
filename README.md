The client.lua and its installer and the server only work in lua (OpenOS), when any installer is finished you can take out the eeprom and put it in a tier 1 or stronger machine, (none of them work with microcontrollers!) and if you turn it on the program will work immediately. The program is made for nuclearcraft reactors! (You need to copi the entire link into the shell, and the installer will install the program into your eeprom execpt the client, that still uses OpenOS)

Here is the link for the Reactor controller server installer:
```
wget -f https://raw.githubusercontent.com/bcuebler/FusionReactOS/main/NCROS_installer.lua /bin/MROS_installer.lua
```

And for the client installer:
```
wget -f https://raw.githubusercontent.com/bcuebler/FusionReactOS/main/MultiReactOS_client_installer.lua /tmp/MROS_client_installer.lua
```
