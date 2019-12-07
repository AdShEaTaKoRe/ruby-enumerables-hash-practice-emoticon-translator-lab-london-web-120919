require "yaml"
require "pp"

def load_library(path)
  lib = YAML.load_file(path)
  
  emoticons = {
    :get_meaning => lib.reduce({}) { |memo, (meaning, emotes)|
      memo[emotes[1]] = meaning
      memo
    },
    :get_emoticon => lib.reduce({}) { |memo, (meaning, emotes)|
      memo[emotes[0]] = emotes[1]
      memo
    }
  }
  
end

def get_emoticon_data(path, emoticon, data)
  lib = load_library(path)
  if lib[data][emoticon]
    return lib[data][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_japanese_emoticon(path, emoticon)
  get_emoticon_data(path, emoticon, :get_emoticon)
end

def get_english_meaning(path, emoticon)
  lib = load_library(path)
  if lib[:get_meaning][emoticon]
    return lib[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end