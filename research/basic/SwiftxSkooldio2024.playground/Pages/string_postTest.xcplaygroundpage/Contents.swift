

// Input string of fruits
let fruitInput = "apple,banana,cherry,date,elderberry"

// 1. Split the string into an array
let fruits = fruitInput.split(separator: ",")

// 2. Create emoji representations for fruits
let fruitEmojis = fruits.map { fruit in "\(fruit)🍎" }

// 3. Create a silly story with string interpolation
let story = """
Once upon a time, a \(fruitEmojis[0]) and a \(fruitEmojis[1]) went on a picnic.
They met a grumpy \(fruitEmojis[2]) who wanted to join them.
The \(fruitEmojis[3]) thought it was a bad idea, but the \(fruitEmojis[4]) disagreed.
In the end, they all became fruity friends and lived happily ever after!
"""

// 4. Convert the story to uppercase
let loudStory = story.uppercased()

// 5. Extract the first letter of each fruit name
let fruitInitials = fruits.map { String($0.prefix(1)) }

// Print the results
print("🍓 Fruit Emoji Mixer 🍓")
print("\nYour Silly Fruit Story:")
print(loudStory)
print("\nFruit Initials:")
print(fruitInitials.joined(separator: ", "))
