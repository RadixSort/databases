#!/usr/bin/env python
import sys

abc = False
last_show = None

for line in sys.stdin:
    line       = line.strip()
    key_value  = line.split('\t')
    curr_show = key_value[0]
    value_in = key_value[1]
    
    if curr_show != last_show:
        if abc == True:
            abc = False
            print( '%s\t%s' % (last_show, running_total) )
        running_total = 0
        last_show = curr_show

    if value_in.isdigit():
        running_total += int(value_in)
    
    if value_in == "ABC":
        abc = True