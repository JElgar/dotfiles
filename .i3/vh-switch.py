#!/usr/bin/env python3
import i3ipc
import subprocess

def sendmessage(message):
    subprocess.Popen(['notify-send', message])
    return

i3          = i3ipc.Connection()
splitv_text = '↓'
splith_text = '→'
split_none  = '•'
parent      = i3.get_tree().find_focused().parent

if parent.layout   == 'splitv' :
    print( splitv_text )
    i3.command('split horizontal')
    sendmessage(splith_text)
elif parent.layout == 'splith' :
    print( splith_text )
    i3.command('split vertical')
    sendmessage(splitv_text)
else                           :
    print( split_none  )

