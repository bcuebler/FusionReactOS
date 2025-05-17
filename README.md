--[ here a description ]--


--[ To Do list ]--
- [ ] 6. option: help and info
- [x] Geiger counter program no predefinied port mode delete
- [x] Fusion reactor controller
- [x] Multi client
- [ ] Fission reactor controller
- [ ] Molten salt reactor controller
- [ ] Heat exchanger controller
- [ ] Turbine controller
- [ ] Multi connect transreciver server for clients(in beta testing)

--[ Known bugs (i mark the bug if i work on it) ]--
- [ ] Geiger counter under 100 urads/t bad reading, or displaying
- [ ] help/info button also an exit(instant)

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
