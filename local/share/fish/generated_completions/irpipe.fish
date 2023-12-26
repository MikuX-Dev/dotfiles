# irpipe
# Autogenerated from man page /usr/share/man/man1/irpipe.1.gz
complete -c irpipe -s d -l device -d 'Set kernel device, default is /dev/irpipe0'
complete -c irpipe -s b -l bin2text -d 'Convert binary data to text'
complete -c irpipe -s t -l text2bin -d 'Convert text data to binary'
complete -c irpipe -s s -l add-sync -d 'Add long initial sync on converted output'
complete -c irpipe -s f -l filter -d 'Send data from stdin to stdout'
complete -c irpipe -s r -l read -d 'Send data from kernel device to stdout'
complete -c irpipe -o l--length -d 'Set kernel device signal length'
complete -c irpipe -o F--features -d 'Set the features bitmask, as returned by the  LIRC_GET_FEATURES ioctl'
complete -c irpipe -s h -l help -d 'Display usage summary'
complete -c irpipe -s v -l version -d 'Display version.  KERNEL DRIVER'
