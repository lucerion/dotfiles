comm! -nargs=* -range Grep call helpers#unite#grep(<count>, <q-args>)
comm! SmartWordToggle call helpers#smartword#toggle()
comm! GS silent exec 'Gstatus | resize ' . (&lines / (tabpagewinnr(tabpagenr(), '$') + 1))
