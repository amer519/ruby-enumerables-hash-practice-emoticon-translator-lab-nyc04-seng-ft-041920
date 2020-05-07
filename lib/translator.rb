require 'yaml'

def load_library(path)
   
  emoticons = {"each_meaning" => {}, "each_emoticon" => {}}
  
  YAML.load_file(path).each do |meaning, describe|
     eng, jan = describe
     emoticons["each_meaning"][jan] = meaning
     emoticons["each_emoticon"][eng] = jan
  end
  emoticons
end

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path) 
  result = emoticons["each_emoticon"][emoticon]
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  result = emoticons["each_meaning"][emoticon] 
  if result
    result
  else
    "Sorry, that emoticon was not found"
  end
end

