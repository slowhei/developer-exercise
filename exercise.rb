class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    return "" if str.length == 0

    marklar = ""

    # The loop below searches for the beginning of a word, then searches for the end of the word
    # This stores the start index at which the search began
    start = 0
    # First index of current word
    # -1 indicates a word has not been found
    word_start = -1

    i = 0
    loop do
      while str[i] !~ /[a-zA-Z]/
        i += 1
        break if i == str.length
      end
      break if i == str.length

      marklar << str[start...i]
      word_start = i
      i += 1
      break if i == str.length

      while str[i] =~ /[a-zA-Z]/
        i += 1
        break if i == str.length
      end
      break if i == str.length

      word_length = i - word_start
      if word_length > 4
        if str[word_start] =~ /[a-z]/
          marklar << "marklar"
        else
          assert(str[word_start] =~ /[A-Z]/)
          marklar << "Marklar"
        end
      else
        marklar << str[word_start...i]
      end

      start = i
      word_start = -1
      i += 1
      break if i == str.length
    end

    if start == str.length then return marklar end

    if word_start == -1
      marklar << str[start...str.length]
    elsif str.length - word_start <= 4
      marklar << str[word_start...str.length]
    elsif str[word_start] =~ /[a-z]/
      marklar << "marklar"
    else
      assert(str[word_start] =~ /[A-Z]/)
      marklar << "Marklar"
    end

    return marklar
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    return 0 if nth < 3

    # Every 3rd term in the sequence is even
    current = 2       # 3rd-term
    prev    = 1       # 2nd-term
    sum     = current
    for i in 1...nth/3
      # next:     current + prev
      # next + 1: (current + prev) + current
      # next + 2: ((current + prev) + current) + (current + prev)
      beforeNextEven = 2*current + prev
      current        = 3*current + 2*prev
      prev           = beforeNextEven
      sum += current
    end

    return sum
  end

  def self.assert(condition)
    raise "Assertion Error" unless condition
  end

end
