def caesar_cipher(text, shift)    
    # Assures that shift would be smaller than the alphabet 
    shift = shift % 26
    
    shifted_text = text.chars.map do |char|
        # Check if the character is a letter
        if char.match?(/[A-Za-z]/)
            base = char.ord < 97? 65: 97
            # 
            shifted_char_ord = ((char.ord - base + shift) % 26) + base;
            shifted_char_ord.chr 
        else 
            char
        end
    end
    puts shifted_text.join("")

end

caesar_cipher("what",10)