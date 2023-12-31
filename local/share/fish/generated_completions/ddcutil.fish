# ddcutil
# Autogenerated from man page /usr/share/man/man1/ddcutil.1.gz
complete -c ddcutil -s d -l dis -l display -d 'display-number  logical display number (starting from 1)'
complete -c ddcutil -s b -l bus -d 'bus-number I2C bus number'
complete -c ddcutil -l hiddev -d 'device number hiddev device number'
complete -c ddcutil -s u -l usb -d 'USB bus and device numbers'
complete -c ddcutil -s g -l mfg -d '3 letter manufacturer code'
complete -c ddcutil -s l -l model -d 'model name'
complete -c ddcutil -s n -l sn -d 'serial number'
complete -c ddcutil -s e -l edid -d '256 hex character representation of the 128 byte EDID'
complete -c ddcutil -s U -l show-unsupported -d 'Normally, getvcp does not report unsupported features when querying a feature…'
complete -c ddcutil -l show-table -l no-table -d 'Normally, getvcp does not report Table type features when querying a feature-…'
complete -c ddcutil -l rw -l ro -l wo -d 'Limit getvcp or vcpinfo output to read-write, read-only, or (for vcpinfo) wri…'
complete -c ddcutil -s t -l terse -l brief -d 'Show brief detail'
complete -c ddcutil -s v -l verbose -d 'Show extended detail Options for program information'
complete -c ddcutil -s h -l help -d 'Show program help'
complete -c ddcutil -s V -l version -d 'Show program version'
complete -c ddcutil -l settings -d 'Report option settings in effect.  Options for diagnostic output'
complete -c ddcutil -l ddc -d 'Reports DDC protocol errors'
complete -c ddcutil -l vstats -d 'Like --stats, but includes per-display statistics'
complete -c ddcutil -l syslog -d 'Write messages of the specified or more urgent severity level to the system l…'
complete -c ddcutil -l enable-capabilities-cache -l disable-capabilities-cache -d 'Enable or disable caching of capabilities strings, improving performance'
complete -c ddcutil -l enable-displays-cache -l disable-displays-cache -d 'Enable or disable caching of information about detected displays, improving p…'
complete -c ddcutil -l sleep-multiplier -d 'Adjust the length of waits listed in the DDC/CI specification by this number …'
complete -c ddcutil -l enable-dynamic-sleep -l disable-dynamic-sleep -d 'Dynamically adjust the sleep-multiplier over multiple ddcutil invocations, im…'
complete -c ddcutil -l async -d 'If there are several monitors, initial checks are performed in multiple threa…'
complete -c ddcutil -l lazy-sleep -d 'Peform mandated sleeps before the next DDC/CI operation instead of immediatel…'
complete -c ddcutil -l maxtries -d 'Adjust the number of retries.   A value of "'
complete -c ddcutil -l verify -l noverify -d 'Verify or do not verify values set by setvcp or loadvcp'
complete -c ddcutil -l mccs -d 'Tailor command input and  output to a particular MCCS version, e. g.  2. 1'
complete -c ddcutil -l enable-udf -l disable-udf -d 'Enable or disable support for user supplied feature definitions'
complete -c ddcutil -l enable-usb -l disable-usb -d 'Enable or disable support for monitors that implement USB commuincation with …'
complete -c ddcutil -l ignore-usb-vid-pid -d 'Force ddcutil to ignore a particular USB device, specified by its 4 hex digit…'
complete -c ddcutil -l ignore-hiddev -d 'Force ddcutil to ignore a particular USB device, specified by /dev/usb/hiddev…'
complete -c ddcutil -l use-file-io -l use-ioctl-io -d 'Cause ddcutil to use the write()/read() interface or the ioctl interface of d…'
complete -c ddcutil -l force-slave-address -d 'Take control of slave addresses on the I2C bus even they are in use'
complete -c ddcutil -l edid-read-size -d 'Force ddcutil to read the specified number of bytes when reading the EDID'

