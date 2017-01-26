class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words,:content, :line_number

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
end
class Solution
  attr_reader :analyzers , :highest_count_across_lines, :highest_count_words_across_lines
  def initialize()
    @analyzers = []
  end
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
    end
    
  end

end
