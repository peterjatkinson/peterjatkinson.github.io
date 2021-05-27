# GET FILENAME FROM COMMAND LINE ARGUMENT AND ASSIGN ITS CONTENTS TO A VARIABLE NAMED 'chapter'
filename = ARGV[0]
 
fh = open filename
 
chapter = fh.read
 
fh.close

# Also next step is to change this so it restarts everything at 0 so it can be used on files that just need the numbering sequence updated, too - maybe do a separate ruby program for that?

#MOVE SQUARE BRACKET TO BEFORE NUMBER (INLINE AND IN FOOTNOTES)
# 1. Remove opening square bracket
chapter.gsub!(/\[\<a href/, "<a href") 
# 2. Reinsert square bracket before number
chapter.gsub!(/(?<=[\d+]'>)/, "[") 

# FOOTNOTE ID NUMBERING
# ADD IN IDs FOR FOOTNOTES (inline needs no ref in 'ftnref')
chapter.gsub!(/(?=href='#_ftnref)/, "id=\"_ftn0\" ")


#NUMBER ALL THE ID TAGS IN FOOTNOTES (inline needs 'ftnref')
idnos = chapter.scan(/(?<=\"\_ftn)\d+/).to_a
length = idnos.size
increment = 1

#REPLACE ALL FOOTNOTE ID NUMBERS WITH INCREMENTAL NUMBERING STARTING AT 1
for i in 0..(length)
  chapter.sub!(/(?<=\"\_ftn)[0]/) { Regexp.last_match[0].to_i + increment } 
  increment = increment + 1   
end


# NOW ONTO THE INLINE ID NUMBERING
# ADD IN IDs FOR INLINE 
chapter.gsub!(/(?=href='#_ftn\d)/, "id=\"_ftnref0\" ")

#NUMBER ALL THE ID TAGS FOR INLINE
idnos = chapter.scan(/(?<=\"\_ftnref)\d+/).to_a
length = idnos.size
increment = 1

#REPLACE ALL INLINE ID NUMBERS WITH INCREMENTAL NUMBERING STARTING AT 1
for i in 0..(length)
  chapter.sub!(/(?<=\"\_ftnref)[0]/) { Regexp.last_match[0].to_i + increment } 
  increment = increment + 1   
end

#MAKE ALL PARAGRAPHS AFTER A HEADING REMOVE THE INDENT
chapter.gsub!(/h1>\s+<p>/, "h1>\n    <p class=\"first-para-section\">")
chapter.gsub!(/h2>\s+<p>/, "h2>\n    <p class=\"first-para-section\">")
chapter.gsub!(/h3>\s+<p>/, "h3>\n    <p class=\"first-para-section\">")

#REMOVE BROKEN IMAGES
chapter.gsub!(/<p><img src="file:\/\/\/C:\\Users\\Toshiba\\AppData\\Local\\Temp\\msohtmlclip1\\01\\clip_image\d+.png\" referrerpolicy=\"no-referrer\" alt=\"img\"><\/p>/, "<div class=\"image-container\">
    <img src=\"/images/placeholder.png\" alt=\"Placeholder\">
    </div>
")
chapter.gsub!(/<p><img src="file:\/\/\/C:\\Users\\Toshiba\\AppData\\Local\\Temp\\msohtmlclip1\\01\\clip_image\d+.jpg\" referrerpolicy=\"no-referrer\" alt=\"img\"><\/p>/, "<div class=\"image-container\">
    <img src=\"/images/placeholder.png\" alt=\"Placeholder\">
    </div>
")

#REMOVE EMPTY PARAGRAPH TAGS
chapter.gsub!(/<p>\s+<\/p>/, "")

#ADD NON-BREAKING SPACE BEFORE FOOTNOTE NUMBERS
chapter.gsub!("<a id=\"_ftnref", "&#8288;<a id=\"_ftnref")

#OUTPUT THE REVISED CONTENTS OF chapter TO THE SAME FILE THAT WAS PUT INTO THE COMMAND LINE ARGUMENT AT THE START
output = File.open( fh, "w" )
output << "#{chapter}"
output.close   

