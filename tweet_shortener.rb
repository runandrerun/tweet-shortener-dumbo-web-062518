# Write your code here.

def dictionary
  dictionary = {
    "hello" => "hi",
    "to" => "2",
    "too" => "2",
    "two" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

# Below the .split.collect splits a STRING (tweet) into an array (separates each word into an index). Then iterate over each index (|word|). This then checks if any of the dictionary hash's keys are included. If so, the word is substituted with the value from the dictionary hash. Else, the word is printed. Then .join(" ") is called to put it back into a string using spaces in between each word.

def word_substituter(tweet)
 tweet.split.collect {|word| dictionary.keys.include?(word.downcase) ? word = dictionary[word.downcase] : word }.join(" ")
end

# Below the method calls in an argument of tweet_array. It's then iterated over by passing it through the word_substituter above. This is to take an array of tweets rather than just 1 array of a tweet.

def bulk_tweet_shortener(tweet_array)
  tweet_array.each do |tweet|
        puts word_substituter(tweet)
    end
end

def selective_tweet_shortener(tweet)
    if tweet.length > 140
       word_substituter(tweet)
    elsif tweet.length <= 140
      tweet
    end
end

def shortened_tweet_truncator(tweet)
  truncated_tweet = ""
  if word_substituter(tweet).length > 140
    truncated_tweet << word_substituter(tweet)[0..136] + "..."
  else
    truncated_tweet << word_substituter(tweet)
  end
end