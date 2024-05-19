BOLD_PHRASES = ['Critical Success', 'Critical Failure', 'Success', 'Failure',
                'Area', 'Defense', 'Cast', 'Range', 'Target(s)', 'Saving Throw',
                'Heightened \(.*\)', 'Duration', 'Targets', 'Trigger', 
                'Prerequisites', 'Requirements', 'Frequency', 'Special',
                'Access']
NEWLINE_PHRASES = ['Critical Success', 'Special']

file = File.open('input.txt')
file_data = file.read

def newline_format(string)
  copy = string.clone
  NEWLINE_PHRASES.each do |phrase|
    regex = Regexp.new("(#{phrase})")
    copy.gsub!(regex, "\n\\0")
  end
  copy
end

def bold_format(string)
  copy = string.clone
  BOLD_PHRASES.each do |phrase|
    regex = Regexp.new("(?<=\n)(#{phrase})(?!<)")
    copy.gsub!(regex, '<b>\0</b>')
  end
  copy
end

edit1 = newline_format(file_data)
edit2 = bold_format(edit1)

File.write('output.txt', edit2)
