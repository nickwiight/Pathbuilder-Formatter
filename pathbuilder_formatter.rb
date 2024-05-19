BOLD_PHRASES = ['Critical Success', 'Critical Failure', 'Success', 'Failure',
                'Area', 'Defense', 'Cast', 'Range', 'Target(s)', 'Saving Throw',
                'Heightened \(.*\)', 'Duration', 'Targets', 'Trigger', 
                'Prerequisites', 'Requirements', 'Frequency', 'Special',
                'Access']
NEWLINE_PHRASES = ['Critical Success', 'Special']
STRING = "WALL MASTER 3 FEAT 13
CONJURATION DUNGEON EARTH MANIPULATE
Frequency once per day
You call forth the notoriously sturdy walls from within your true dungeon body to subject your foes to the frustration of being lost or separated in a dungeon and forced to return to the entrance. This has the effects of the wall of stone spell.
Special This feat gains the divine trait if you have the mausoleum heritage, arcane if you have another artificial dungeon heritage (such as labyrinth or tower) or primal if you have a natural one (such as an archipelago, caverns, leviathan, or tree)."

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
    regex = Regexp.new("(#{phrase})(?!<)")
    copy.gsub!(regex, '<b>\0</b>')
  end
  copy
end

edit1 = newline_format(file_data)
edit2 = bold_format(edit1)

File.write('output.txt', edit2)
