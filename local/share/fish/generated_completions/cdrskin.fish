# cdrskin
# Autogenerated from man page /usr/share/man/man1/cdrskin.1.gz
complete -c cdrskin -l help -d 'Show non-cdrecord compatible options'
complete -c cdrskin -o help -d 'Show cdrecord compatible options'
complete -c cdrskin -o version -d 'Print cdrskin id line, compatibility lure line, libburn version, cdrskin vers…'
complete -c cdrskin -o atip -d 'Retrieve some info about media state.  With CD-RW print "Is erasable"'
complete -c cdrskin -o audio -d 'Announces that the subsequent tracks are to be burned as audio'
complete -c cdrskin -o checkdrive -d 'Retrieve some info about the addressed drive and then exit'
complete -c cdrskin -o copy -d 'Create the subsequent tracks with permission for an unlimited number of copies'
complete -c cdrskin -o dao -d 'Alias for option -sao'
complete -c cdrskin -o data -d 'Subsequent tracks are data tracks'
complete -c cdrskin -o xa1 -d 'Subsequent tracks are data tracks with input suitable for CD-ROM XA mode 2 fo…'
complete -c cdrskin -o dummy -d 'Try to perform the drive operations without actually affecting the inserted m…'
complete -c cdrskin -o eject -d 'Eject the disc after work is done'
complete -c cdrskin -o force -d 'Assume that the user knows better in situations when cdrskin or libburn are r…'
complete -c cdrskin -o format -d 'Same as blank=format_overwrite_full -force but restricted to DVD+RW'
complete -c cdrskin -o immed -d 'Equivalent to: . br modesty_on_drive=1:min_percent=75:max_percent=95 '
complete -c cdrskin -o inq -d 'Print the identification of the drive and then exit'
complete -c cdrskin -o isosize -d 'The next track following this option will try to obtain its source size from …'
complete -c cdrskin -o load -d 'Load the media and exit'
complete -c cdrskin -o lock -d 'Like option -load but leave the drive\'s eject button disabled if there is any…'
complete -c cdrskin -o minfo -d 'Print information about the loaded media'
complete -c cdrskin -o msinfo -d 'Retrieve multi-session info for preparing a follow-up session by option -C of…'
complete -c cdrskin -o multi -d 'This option keeps CD, unformatted DVD-R[W], DVD+R, or BD-R appendable after t…'
complete -c cdrskin -o nocopy -d 'Create subsequent tracks with permission for a single level of copies.  I. e'
complete -c cdrskin -o nopad -d 'Do not add trailing zeros to the data stream'
complete -c cdrskin -o nopreemp -d 'Indicate for subsequent tracks that they were mastered without pre-emphasis'
complete -c cdrskin -o pad -d 'Add 30 kiB of trailing zeros to each data track'
complete -c cdrskin -o preemp -d 'Indicate for subsequent tracks that they were mastered with pre-emphasis'
complete -c cdrskin -o sao -d 'Write CD in Session At Once mode or sequential DVD-R[W] in Disc-at-once (DAO)…'
complete -c cdrskin -o scanbus -d 'Scan the system for drives'
complete -c cdrskin -o scms -d 'Create subsequent tracks without permission for being copied'
complete -c cdrskin -o swab -d 'Announce that the raw audio data source of subsequent tracks is byte swapped …'
complete -c cdrskin -o tao -d 'Write CD in Track At Once (TAO) mode, sequential DVD-R[W] in Incremental Stre…'
complete -c cdrskin -o text -d 'Enable writing of CD-TEXT attributes read by option cuefile='
complete -c cdrskin -o toc -d 'Print the table of content (TOC) which describes the tracks recorded on disc'
complete -c cdrskin -s v -d 'Increment verbosity level by one.  Startlevel is 0 with only few messages'
complete -c cdrskin -s V -d 'Enable logging of SCSI commands to stderr'
complete -c cdrskin -o waiti -d 'Wait until input data is available at stdin or EOF occurs at stdin'
complete -c cdrskin -l adjust_speed_to_drive -d 'Curb explicitly given speed= values to the maximum which is announced by the …'
complete -c cdrskin -l allow_emulated_drives -d 'Enable drive addresses of the form dev=stdio:<path>'
complete -c cdrskin -l allow_setuid -d 'Disable the loud warning about insecure discrepance between login user and ef…'
complete -c cdrskin -l any_track -d 'Allow source_addresses to begin with "-" (plus further characters) or to cont…'
complete -c cdrskin -l demand_a_drive -d 'Exit with a nonzero value if no drive can be found during a bus scan'
complete -c cdrskin -l devices -d 'List the device file addresses of all accessible CD drives'
complete -c cdrskin -l device_links -d 'Like --devices, but presenting the drives with addresses of symbolic links wh…'
complete -c cdrskin -l extract_dap -d 'Enable Digital Audio Play flaw obscuring mechanisms like audio data mute and …'
complete -c cdrskin -l four_channel -d 'Indicate for subsequent tracks that they were mastered with four channels'
complete -c cdrskin -l grow_overwriteable_iso -d 'Enable emulation of multi-session writing on overwriteable media which contai…'
complete -c cdrskin -l list_formats -d 'List the available format descriptors as reported by the drive for the loaded…'
complete -c cdrskin -l list_ignored_options -d 'List all ignored cdrecord options'
complete -c cdrskin -l list_speeds -d 'Put out a list of speed values as reported by the output drive with the loade…'
complete -c cdrskin -l long_toc -d 'Like option -toc but marking each session start by a line "first: X last: Y" …'
complete -c cdrskin -l no_load -d 'When aquiring the optical drive, do not try to load its tray'
complete -c cdrskin -l no_rc -d 'Only if used as first command line argument this option prevents reading and …'
complete -c cdrskin -l pacifier_with_newline -d 'Adds a newline character to each pacifier line that would elsewise be overwri…'
complete -c cdrskin -l prodvd_cli_compatible -d 'Activates behavior modifications with some DVD situations which bring cdrskin…'
complete -c cdrskin -l single_track -d 'Accept only the last argument of the command line as track source address'
complete -c cdrskin -l tell_media_space -d 'Prepare a recording session, do not perform it but rather inquire the maximum…'
complete -c cdrskin -l two_channel -d 'Indicate for subsequent tracks that they were mastered with two channels'
complete -c cdrskin -l abort_handler -d 'Establish default signal handling not to leave a drive in busy state but rath…'
complete -c cdrskin -l allow_untested_media -d 'Enable the use of media profiles which have been implemented but not yet test…'
complete -c cdrskin -l cdtext_dummy -d 'Prepare a burn run, report the effective array of CD-TEXT packs to stdout, an…'
complete -c cdrskin -l cdtext_verbose -d 'Like --cdtext_dummy but without preventing the burn run'
complete -c cdrskin -l drive_abort_on_busy -d 'Linux specific: Abort process if a busy drive is encountered'
complete -c cdrskin -l drive_blocking -d 'Linux specific: Try to wait for a busy drive to become free'
complete -c cdrskin -l drive_f_setlk -d 'Linux specific: Try to get exclusive lock on drive device file via fcntl(2)'
complete -c cdrskin -l drive_not_exclusive -d 'Linux specific: Combine --drive_not_f_setlk and --drive_not_o_excl'
complete -c cdrskin -l drive_not_f_setlk -d 'Linux specific: Do not try to get exclusive lock on drive device file via fcn…'
complete -c cdrskin -l drive_not_o_excl -d 'Linux specific: Do not ask the operating system to prevent opening busy drives'
complete -c cdrskin -l drive_scsi_exclusive -d 'Linux specific: Try to exclusively reserve device files /dev/srN, /dev/scdM, …'
complete -c cdrskin -l fifo_disable -d 'Disable fifo despite any fs='
complete -c cdrskin -l fifo_per_track -d 'Use a separate fifo for each track'
complete -c cdrskin -l fill_up_media -d 'Expand the last track of the session to occupy all remaining free space on th…'
complete -c cdrskin -l ignore_signals -d 'Try to ignore any signals rather than to abort the program'
complete -c cdrskin -l list_features -d 'List the SCSI/MMC features which were obtained from the drive when it was las…'
complete -c cdrskin -l no_abort_handler -d 'On signals exit even if the drive is in busy state'
complete -c cdrskin -l no_blank_appendable -d 'Refuse to blank appendable CD-RW or DVD-RW'
complete -c cdrskin -l no_convert_fs_adr -d 'Do only literal translations of dev='
complete -c cdrskin -l obs_pad -d 'Pad the data of the last write operation of a DVD-R[W] DAO session, or BD-R s…'
complete -c cdrskin -l bdr_obs_exempt -d 'Exempt BD-R media from automatic unconditional transaction end padding, provi…'
complete -c cdrskin -l old_pseudo_scsi_adr -d 'Linux specific: Use and report literal Bus,Target,Lun addresses rather than r…'
complete -c cdrskin -l xa1-ignore -d 'Silently interpret option -xa1 as -data'

