#read 
#show_views_file = sc.textFile("input1/join2_gennum?.txt")
#show_channel_file = sc.textFile("input/join2_genchan?.txt")

def split_show_views(line):
    show, views = line.split(",")
    return (show, views)

def split_show_channel(line):
	show, channel = line.split(',')
	return (show, channel)

#parse
#show_views = show_views_file.map(split_show_views)
#show_channel = show_channel_file.map(split_show_channel)

#join
#joined_dataset = show_channel.join(show_views)

#extract key (channel)
def extract_channel_views(show_views_channel):
	channel, views = show_views_channel[1]
	views = int(views)
	return (channel, views)

#channel_views = joined_dataset.map(extract_channel_views)

#cumulate all channel
def calculate_sum(a,b):
	channel_views = int(a) + int(b)
	return channel_views
#channel_views.reduceByKey(calculate_sum).collect()

#Out[30]:                                                                        
#[(u'XYZ', 5208016),
# (u'DEF', 8032799),
# (u'CNO', 3941177),
# (u'BAT', 5099141),
# (u'NOX', 2583583),
# (u'CAB', 3940862),
# (u'BOB', 2591062),
# (u'ABC', 1115974),
# (u'MAN', 6566187)]
