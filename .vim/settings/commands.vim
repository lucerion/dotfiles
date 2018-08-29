comm! -nargs=* -range Grep call helpers#unite#grep(<count>, <q-args>)
comm! SmartWordToggle call helpers#smartword#toggle()
comm! GStatus silent exec 'Gstatus | resize ' . (&lines / (tabpagewinnr(tabpagenr(), '$') + 1))
comm! GCommit silent exec 'Git commit'
comm! CD silent exec 'lcd ' . expand('%:p:h') | echo 'cwd: ' . getcwd()
