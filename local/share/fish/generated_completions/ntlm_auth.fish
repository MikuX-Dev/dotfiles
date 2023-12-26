# ntlm_auth
# Autogenerated from man page /usr/share/man/man1/ntlm_auth.1.gz
complete -c ntlm_auth -l username -d 'Specify username of user to authenticate'
complete -c ntlm_auth -l domain -d 'Specify domain of user to authenticate'
complete -c ntlm_auth -l workstation -d 'Specify the workstation the user authenticated from'
complete -c ntlm_auth -l challenge -d 'NTLM challenge (in HEXADECIMAL)'
complete -c ntlm_auth -l lm-response -d 'LM Response to the challenge (in HEXADECIMAL)'
complete -c ntlm_auth -l nt-response -d 'NT or NTLMv2 Response to the challenge (in HEXADECIMAL)'
complete -c ntlm_auth -l password -d 'User\\*(Aqs plaintext password '
complete -c ntlm_auth -l request-lm-key -d 'Retrieve LM session key'
complete -c ntlm_auth -l request-nt-key -d 'Request NT key'
complete -c ntlm_auth -l diagnostics -d 'Perform Diagnostics on the authentication chain'
complete -c ntlm_auth -l require-membership-of -d 'Require that a user be a member of specified group (either name or SID) for a…'
complete -c ntlm_auth -l pam-winbind-conf -d 'Define the path to the pam_winbind. conf file'
complete -c ntlm_auth -l target-hostname -d 'Define the target hostname'
complete -c ntlm_auth -l target-service -d 'Define the target service'
complete -c ntlm_auth -l use-cached-creds -d 'Whether to use credentials cached by winbindd'
complete -c ntlm_auth -l allow-mschapv2 -d 'Explicitly allow MSCHAPv2'
complete -c ntlm_auth -l offline-logon -d 'Allow offline logons for plain text auth'
complete -c ntlm_auth -s '?' -l help -d 'Print a summary of command line options'
complete -c ntlm_auth -l usage -d 'Display brief usage message'
complete -c ntlm_auth -s d -l debuglevel -d 'level is an integer from 0 to 10'
complete -c ntlm_auth -l debug-stdout -d 'This will redirect debug output to STDOUT'
complete -c ntlm_auth -l configfile -d 'The file specified contains the configuration details required by the client'
complete -c ntlm_auth -l option -d 'Set the smb. conf(5) option "<name>" to value "<value>" from the command line'
complete -c ntlm_auth -s V -l version -d 'Prints the program version number'
complete -c ntlm_auth -l helper-protocol

