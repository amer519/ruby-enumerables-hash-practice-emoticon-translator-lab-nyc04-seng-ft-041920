require "yaml"
emojis = YAML.load_file('./lib/emoticons.yml')

def load_library(file_path)
  emojis = YAML.load_file(file_path)
  organized_emojis = {}

  emojis.each do |key, value|
    
    if !organized_emojis.include?(key)
      organized_emojis[key] = {}
    end

    if !organized_emojis[key].include?(value[0])
        organized_emojis[key] = {english: value[0], japanese: value[1]}
    end
  end 
  return organized_emojis
end

def get_japanese_emoticon(file_path, emoticon)
  emoji_Dictionary = load_library(file_path)

  emoji_Dictionary.each do |topLevel_Key, topLevel_Value|
    # puts topLevel_Key
    topLevel_Value.each do |midLevel_Key, midLevel_Value|
      # puts midLevel_Key
      # puts midLevel_Value
      # if midLevel_Value.include?(emoticon)
      if emoticon.include?(midLevel_Value)
        # puts topLevel_Value[:english]
        # return topLevel_Key, topLevel_Value[:japanese]
        return topLevel_Value[:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoji_Dictionary = load_library(file_path)

  emoji_Dictionary.each do |topLevel_Key, topLevel_Value|
    topLevel_Value.each do |midLevel_Key, midLevel_Value|
      if emoticon.include?(midLevel_Value)
        return topLevel_Key
      end
    end
  end
  return "Sorry, that emoticon was not found"
end