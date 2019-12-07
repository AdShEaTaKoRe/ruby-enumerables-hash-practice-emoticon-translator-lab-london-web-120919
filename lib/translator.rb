require "yaml"

def load_library(path)
  lib = YAML.load_file(path)
  
  emoticons = {
    :get_meaning => lib.reduce({}) { |memo, emote|
      memo[emote[1]] = {}
    },
    :get_emoticon => {}
  }
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end