
# GET FILENAME FROM COMMAND LINE ARGUMENT AND ASSIGN ITS CONTENTS TO A VARIABLE NAMED 'chapter'
filename = ARGV[0]
 
fh = open filename
 
chapter = fh.read
 
fh.close

# RESET ALL INLINE ID NOs TO 0
chapter.gsub!(/(?<=<a id=\"_ftnref)\d+/, "0")


#REPLACE ALL INLINE ID NUMBERS WITH INCREMENTAL NUMBERING STARTING AT 1
idnos = chapter.scan(/(?<=<a id=\"_ftnref)0/).to_a
length = idnos.size
increment = 1


for i in 0..(length)
  chapter.sub!(/(?<=<a id=\"_ftnref)0/) { Regexp.last_match[0].to_i + increment } 
  increment = increment + 1   
end


# RESET ALL FOOTNOTE ID NOs TO 0
chapter.gsub!(/(?<=id="_ftn)\d+/, "0")

#REPLACE ALL FOOTNOTE ID NUMBERS WITH INCREMENTAL NUMBERING STARTING AT 1
idnos = chapter.scan(/(?<=id="_ftn)0/).to_a
length = idnos.size
increment = 1

for i in 0..(length)
  chapter.sub!(/(?<=id="_ftn)0/) { Regexp.last_match[0].to_i + increment } 
  increment = increment + 1   
end

# # RESET ALL INLINE HREF SINGLE DIGIT NOs TO 0
# chapter.gsub!(/(?<=<a id=\"_ftnref\d\" href=\'#_ftn)\d\'/, "0'")

# #REPLACE ALL INLINE HREF SINGLE DIGIT NUMBERS WITH INCREMENTAL NUMBERING STARTING AT 1
# idnos = chapter.scan(/(?<=<a id=\"_ftnref\d\" href=\'#_ftn)\d\'/).to_a
# length = idnos.size
# increment = 1

# for i in 0..(length)
#   chapter.sub!(/(?<=<a id=\"_ftnref\d\" href=\'#_ftn)\d/) { Regexp.last_match[0].to_i + increment } 
#   increment = increment + 1   
# end

puts chapter