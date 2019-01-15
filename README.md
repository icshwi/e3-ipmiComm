e3-ipmiComm
=====
ESS Site-specific EPICS module : ipmiComm

```
$ make init
$ make build
$ make install
```

## Site-Specific DB files

We removed the alias, and simplify substitutions files. They are located in [template](https://github.com/icshwi/e3-ipmiComm/tree/master/template) and will be infalted and install into e3. 

```
bash tools/remove_alias.bash 
```



[ESS Specific DB Files](template/README.md)

## MCH access

We uses the MOXA to MCH with a debug cable, so one can access the MCH via

```
telnet 10.4.8.102 4001
```

