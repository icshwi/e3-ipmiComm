


SLAC has db, substitutions, substitutions, and they are inflating into db files all. However, ESS has template, substitutions, substitutions, and only sumstitutions are inflating into db files. 


##  db template files

No alias version of the SLAC original ones

- [x] `fru_common_ess.template`
- [x] `sensor_ai_ess.template`
- [x] `fru_cu_common_ess.template`
- [x] `system_powerstate_unsupported_ess.template`
- [x] `system_common_ess.template`
- [x] `system_chassis_status_ess.template`


## Files that make up our high-level templates

- [x] `fru_basic_ess.substitutions`    (fru_common_ess.template, sensor_ai_ess.template)
- [x] `fru_extended_ess.substitutions` (fru_common_ess.template, sensor_ai_ess.template)
- [x] `fru_pm_ess.substitutions`       (fru_common_ess.template, sensor_ai_ess.template)
- [x] `fru_cu_ess.substitutions`       (fru_cu_common_ess.template, fru_common_ess.template, sensor_ai_ess.template)


# substitutions files to be loaded per device 
Note that **-ess.substitutions** instead of **_ess.substitutions**.

- [x] `mtca9u-ess.substitutions`
  - system_common_ess.template
  - system_powerstate_unsupported_ess.template
  - fru_basic_ess.db
  - fru_cu_ess.db
  - fru_pn_ess.db
  
- [ ] `mtca3u-ess.substitutions`
  - system_common_ess.template
  - system_powerstate_unsupported_ess.template
  - fru_basic_ess.db
  - fru_cu_ess.db
  - fru_pn_ess.db

```
