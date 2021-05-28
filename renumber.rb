
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

#RESET ALL FOOTNOTE HREFs TO 0, AND ALL FOOTNOTE ACTUAL TEXT NUMBERS TO 0
chapter.gsub!(/(?<=#_ftnref)\d+\'>\[\d+/, "0\'>[0")

#REPLACE ALL FOOTNOTE HREF NUMBERS WITH INCREMENTAL NUMBERING STARTING AT 1
hrefnos = chapter.scan(/(?<=#_ftnref)0/).to_a
length = hrefnos.size
increment = 1

for i in 0..(length)
  chapter.sub!(/(?<=#_ftnref)0/) { Regexp.last_match[0].to_i + increment } 
  increment = increment + 1   
end

#REPLACE ALL FOOTNOTE ACTUAL WITH INCREMENTAL NUMBERING STARTING AT 1
actualnos = chapter.scan("[0]")
length = actualnos.size
increment = 1

for i in 0..(length)
  chapter.sub!(/(?<=\[)0/) { Regexp.last_match[0].to_i + increment } 
  increment = increment + 1   
end

#RESET ALL INLINE HREFs TO 0, AND ALL INLINE ACTUAL TEXT NUMBERS TO 0
chapter.gsub!(/(?<=#_ftn)\d+\'>\[\d+/, "0\'>[0")

#REPLACE ALL INLINE HREF NUMBERS WITH INCREMENTAL NUMBERING STARTING AT 1
hrefnos = chapter.scan(/(?<=#_ftn)0/).to_a
length = hrefnos.size
increment = 1

for i in 0..(length)
  chapter.sub!(/(?<=#_ftn)0/) { Regexp.last_match[0].to_i + increment } 
  increment = increment + 1   
end

#REPLACE ALL INLINE ACTUAL NUMBERS WITH INCREMENTAL NUMBERING STARTING AT 1
actualnos = chapter.scan("[0]")
length = actualnos.size
increment = 1

for i in 0..(length)
  chapter.sub!(/(?<=\[)0/) { Regexp.last_match[0].to_i + increment } 
  increment = increment + 1   
end

# puts chapter

#OUTPUT THE REVISED CONTENTS OF chapter TO THE SAME FILE THAT WAS PUT INTO THE COMMAND LINE ARGUMENT AT THE START
output = File.open( fh, "w" )
output << "#{chapter}"
output.close   