# MultiReactOS

--[ here a description ]--

The installation help and the documentations are in the HELP.TXT

# Hardware requirements
 - tier 1 ram or more
 - tier 1 cpu or higher
 - tier 1 gpu  or higher (program-dependent)
 - tier 1 (or higher) wireless or normal network card (program-dependent)
 - tier 1 screen or higher (program-dependent)
 - external or internal redstone i/o (card or block) tier 1 or higher (program-dependent)
 - reactor or geiger counter block from nuclear craft (except if you install the client program)

# To Do list
- [ ] 6. option: help and info
- [ ] option editor (for changing the program's settings after it's been written tho the storage media)
- [x] Geiger counter program no predefinied port mode delete
- [x] Fusion reactor controller
- [x] Multi client
- [ ] Fission reactor controller
- [ ] Molten salt reactor controller
- [ ] Heat exchanger controller
- [ ] Turbine controller
- [ ] Multi connect transreciver server for clients(in beta testing)
- [ ] adding server to installer
- [ ] adding radiation scrubber
- [ ] Make a more nicer README



# Known bugs (i mark the bug it's fixed)
- [ ] Geiger counter under 100 urads/t bad reading, or displaying
- [ ] Multi client start with a "trying to compare with a nil value error" and reboot will fix it
- [x] Geiger counter program will eat up the real computer's cpu (probably the delay loop is the problem)



# Functions
- [x] Multi client installer
- [x] Fusion ReactOS installer
- [x] Geiger counter installer(with some bugs)
- [ ] help



# testing
- [x] fission reactor controller
- [ ] molten salt utilitys controller
- [x] help function
- [x] server



# dev 
- [x] fission reactor controller
- [ ] molten salt utilitys controller
- [ ] help function
- [ ] server


# Links/releases

Here is the link for the Reactor controller server installer (old version, i will not update this):
```
wget -f https://raw.githubusercontent.com/bcuebler/FusionReactOS/main/NCROS_installer.lua /bin/MROS_installer.lua
```

And for the client installer (old version, i will not update this):
```
wget -f https://raw.githubusercontent.com/bcuebler/FusionReactOS/main/MultiReactOS_client_installer.lua /tmp/MROS_client_installer.lua && /tmp/MROS_client_installer.lua
```

And for the Multi installer (i work on this):
```
wget -f https://raw.githubusercontent.com/bcuebler/FusionReactOS/main/MultiReactOS_multi_installer.lua /tmp/MROS_multi_installer.lua && /tmp/MROS_multi_installer.lua
```
