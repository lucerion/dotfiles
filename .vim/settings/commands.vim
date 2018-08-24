comm! -nargs=* -range Grep call settings#unite#grep(<count>, <q-args>)
comm! SmartWordToggle call settings#smartword#toggle()
comm! GS silent exec 'Gstatus | resize ' . (&lines / (tabpagewinnr(tabpagenr(), '$') + 1))
