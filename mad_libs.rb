class MadLibs

  attr_reader :story_file

  def initialize(story_file)
    @story_file = story_file
    @new_story  = ""
  end

  def fill_placeholders
    do_replacement story
  end

  def display_story
    puts @new_story
  end

  def do_replacement(story)
    return if story.nil? || story.length == 0

    first, place_holder_match, remaining_story = story.partition(place_holder_regex)
    @new_story += first

    if place_holder_match != ""

      place_holder_match.gsub!('(', '').gsub!(')', '')
      puts "Enter #{place_holder_match}"
      replacement = gets
      @new_story += replacement.chomp
      do_replacement remaining_story
    end
  end

  private

  def story
    raise "File not found" unless File.exists?(story_file)
    File.open(story_file) do |f|
      @story = f.read
    end
  end

  def place_holder_regex
    /\(\((.*?)\)\)/
  end
end

if __FILE__ == $0
  m = MadLibs.new('story_1.txt')
  m.fill_placeholders
  m.display_story
end