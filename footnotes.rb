chapter = "<h1>CHAPTER 4</h1>
<h1>Boughton, The Perfect Wagnerite</h1>
<p>I have set myself to teach the British public about Wagner—for the simple reason that if they do not understand Wagner they will not understand me. And that would be a pity![<a href='#_ftn1'>1]</a></p>
<p>-     Rutland Boughton</p>
<p>In 1911 Rutland Boughton and Reginald R. Buckley published a short book outlining their vision for a new kind of music drama. They called it ‘choral drama’ and at the back of their manifesto was the libretto for the first of these dramas, entitled <em>Uther and Igraine</em> (later renamed <em>The Birth of Arthur</em>). The publication’s self-consciously Wagnerian title, <em>Music-Drama of the Future</em>, reflected its authors’ equally intentional ‘continuation of the German master’s drama’, to which they were ‘greatly indebted’ but which in their view had also ‘failed thoroughly to achieve’ what their planned cycle of Arthurian choral dramas would.[<a href='#_ftn2'>2]</a> While the pair’s ambitious plans to build a theatre in which to perform their dramas, and to construct an agricultural commune around it,[<a href='#_ftn3'>3]</a> never fully materialised, they did lead to a series of festivals held in Glastonbury between 1914 and 1927.[<a href='#_ftn4'>4]</a> In the fourth edition of <em>The Perfect Wagnerite</em> George Bernard Shaw described these festivals as ‘Little Bayreuth’, and their organiser, Boughton, as a ‘Perfect Wagnerite’.[<a href='#_ftn5'>5]</a>

<p>[<a href='#_ftnref1'>1]</a> Rutland Boughton, ‘The Wagner Virus’, <em>Musical Standard</em>, 32 (14 Aug. 1909), 100.</p>
      <p>[<a href='#_ftnref2'>2]</a> Rutland Boughton and Reginald R. Buckley, <em>Music-Drama of the Future: Uther and Igraine, Choral Drama</em> (London: William Reeves, 1911), 1. The book contained an essay by each author: Boughton’s was entitled ‘Drama of the Future: An Essay on Choral Drama’, while Buckley’s was entitled ‘The Growth of Dreams’. In subsequent citations I will cite the author who wrote the particular part of the pamphlet that is quoted or referred to.</p>
      <p>[<a href='#_ftnref3'>3]</a> Boughton, <em>Music-Drama of the Future</em>, 37.</p>
      <p>[<a href='#_ftnref4'>4]</a> For the most comprehensive account of Boughton’s life and the Glastonbury Festivals, see Michael Hurd, <em>Rutland Boughton and the Glastonbury Festivals</em> (Oxford: Clarendon Press, 1993). </p>
      <p>[<a href='#_ftnref5'>5]"

# FIRST NEED TO DO FIND AND REPLACE ALL FOR (a) all single backslashes to become '\\' and then all double quotation marks to become '\"' - but not sure how that works if the file becomes the input (will it automatically fail because of these non-escaped characters?)


#MOVE SQUARE BRACKET TO BEFORE NUMBER (INLINE AND IN FOOTNOTES)
# 1. Remove opening square bracket
chapter.gsub!(/\[\<a href/, "<a href") 
# 2. Reinsert square bracket before number
chapter.gsub!(/(?<=[\d+]'>)/, "[") 


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

puts chapter