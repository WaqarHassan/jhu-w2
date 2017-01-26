#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
  attr_reader :highest_wf_count, :highest_wf_words,:content, :line_number

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result
  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency 
  end
  def calculate_word_frequency
    words  = @content.split(' ')
    frequency = Hash.new(0)
    words.each {|word| frequency[word.downcase] += 1}
    frequency = frequency.sort_by {|key,value| value}.reverse
    @highest_wf_count = frequency.first[1]
    @highest_wf_words = []
    frequency.each do |kv|
      if kv[1] == @highest_wf_count
        @highest_wf_words << kv[0]
      end
    end

  end
  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
end

#  Implement a class called Solution. 
class Solution
  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in 
  #  the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the 
  #  highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
  attr_reader :analyzers , :highest_count_across_lines, :highest_count_words_across_lines
  def initialize()
    @analyzers = []
  end
  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  def analyze_file
    @analyzers = []
    i = 1
    File.foreach("test.txt") do |line|
      @analyzers << LineAnalyzer.new(line, i)
      i = i+ 1
      puts line
    end

  end
  def calculate_line_with_highest_frequency
    sorted_analyzers = @analyzers.sort_by{|la| la.highest_wf_count}.reverse
    @highest_count_across_lines  =  sorted_analyzers.first.highest_wf_count
    @highest_count_words_across_lines = sorted_analyzers.find_all{|obj| obj.highest_wf_count == @highest_count_across_lines}
    # puts "---------------------------"
    # puts @highest_count_across_lines 
    # puts "---------------------------"
    # @highest_count_words_across_lines.each do|content|
    #   puts content.content
    # end
    # puts "*****************************************"


  end
  def print_highest_word_frequency_across_lines
    puts "The following words have the highest word frequency per line:"
    @highest_count_words_across_lines.each do |l_a|
      str = ""
      str += '["'
      l_a.highest_wf_words.each do |word|
        str+= word
        str+= '",'
      end
      str = str.chop
      str += ']'
      print str
      puts " (appears in line #{l_a.line_number} )"
      # puts "["word1"] (appears in line #)"
      # puts "["
    end
    
  end
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
end

  # puts '["'
  # s = Solution.new
  # s.analyze_file
  # s.calculate_line_with_highest_frequency
  # s.print_highest_word_frequency_across_lines


  # puts s.highest_count_across_lines
  # ana = s.analyzers.sort_by{|la| la.highest_wf_count}.reverse
  # aaa = ana.find_all{|obj| obj.highest_wf_count == s.highest_count_across_lines}
  # # aaa = ana.where(:highest_wf_count => s.highest_count_across_lines)
  # aaa.each do  |l|
  #   puts l.line_number
  #   puts "---"
  #   puts l.content
  # end
  # puts aaa.first.content
  # puts aaa.second.content
  # puts s.analyzers.first.content
  # puts s.analyzers.sort_by {|obj| obj.highest_wf_count}.reverse.first.highest_wf_count
  # puts a.first.highest_wf_count
  # puts a.first.content
  # puts a.first.highest_wf_words


  # puts s.analyzers.first.content
  # puts s.analyzers.first.line_number
  # puts s.analyzers.first.highest_wf_count



# puts "running ..."

#  la = LineAnalyzer.new("i am i waqar i am hassan am ", 3)
#  puts la.content
#  la.calculate_word_frequency
#  puts la.highest_wf_count
#  la.highest_wf_words.each do |word|
#     puts "---" + word
#   end
#  puts la.highest_wf_words
#  # analyzers = []
#  # analyzers<< [LineAnalyzer.new]
#  i = 1
# File.foreach("test.txt") do |line|
#       puts i.to_s + " >>>  " +line
#       i = i + 1s
# end
