module NiceTextCaptcha
  module Types
    class DefaultQuestion

      ANIMALS = ["dog", "cat", "dolphin", "mouse", "horse", "penguin", "panda", "tiger", "lion", "zebra"]
      COLOURS = ["black", "white", "red", "green", "blue", "pink", "purple", "orange", "yellow", "brown"]

      attr_reader :question
      attr_reader :answers

    private

      def fifty_fifty?
        rand(2) == 0
      end

      def number_to_word(number)
        number.to_i.en.numwords
      end

      def number_to_ordinal(number)
        number.to_i.en.ordinal
      end
  
      def randomly_quote(word)
        q = ["'", "\""].rand
        q + word + q
      end
  
      def randomly_capitalise(word)
        fifty_fifty? ? word : word.capitalize
      end
  
      def randomly_quote_and_capitalise(word)
        randomly_quote(randomly_capitalise(word))
      end
  
      def randomly_sort(list)
        list.sort { |x,y| rand(100) <=> rand(100) }
      end  

    end
  end
end