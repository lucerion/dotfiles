comm! -nargs=* -range Grep call helpers#unite_grep(<count>, <q-args>)
comm! SmartWordToggle call helpers#smartword_toggle()
comm! GS silent exec 'Gstatus | resize ' . (&lines / (tabpagewinnr(tabpagenr(), '$') + 1))
