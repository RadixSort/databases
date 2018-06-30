#fileA = sc.textFile("input/join1_FileA.txt")
#fileA.collect()
#Out[]: [u'able,991', u'about,11', u'burger,15', u'actor,22']
#fileB = sc.textFile("input/join1_FileB.txt")

def split_fileA(line):
    # split the input line in word and count on the comma
    key_value = line.split(',')
    word = key_value[0]
    count = int(key_value[1])
    # turn the count to an integer  
    return (word, count)

#test_line = "able,991"
#split_fileA(test_line)
#Out[]: ('able', 991)
#fileA_data = fileA.map(split_fileA)
#fileA_data.collect()
#Out[]: [(u'able', 991), (u'about', 11), (u'burger', 15), (u'actor', 22)]

def split_fileB(line):
    # split the input line into word, date and count_string
    date_word, count_string = line.split(",")
    date, word = date_word.split(" ")
    return (word, date + " " + count_string) 

#fileB_data = fileB.map(split_fileB)
#fileB_joined_fileA = fileB_data.join(fileA_data)
#fileB_joined_fileA.collect()
#Out[]:                                                                        
#[(u'about', (u'Feb-02 3', 11)),
# (u'about', (u'Mar-03 8', 11)),
# (u'able', (u'Jan-01 5', 991)),
# (u'able', (u'Apr-04 13', 991)),
# (u'able', (u'Dec-15 100', 991)),
# (u'actor', (u'Feb-22 3', 22)),
# (u'burger', (u'Feb-23 5', 15)),
# (u'burger', (u'Mar-08 2', 15))]