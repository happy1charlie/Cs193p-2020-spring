

# CS193p-2020-spring

This is my progress for Standford's CS193p - Spring 2020.

This repo contains my notes and assignment solitions of this course. Hope this can help you when facing the same questions as me.



### Progress

___

| Lectures                                                     | Notes | Demo | Assignments |
| ------------------------------------------------------------ | ----- | -------- | ----------- |
| [1: Intro to SwiftUI](https://www.youtube.com/watch?v=jbtqIBpUG7g&list=PLpGHT1n4-mAtTj9oywMWoBx0dCGd51_yG&index=14) |  |          |             |
| [2: MVVM&Swift Type System](https://www.youtube.com/watch?v=4GjXq2Sr55Q&list=RDCMUC-EnprmCZ3OXyAoG7vjVNCA&index=1) |       |          |             |
| [3: Reactive UI + Protocols + Layout](https://www.youtube.com/watch?v=SIYdYpPXil4) |       |          |             |
| [4: Grid + enum + Optionals](https://www.youtube.com/watch?v=eHEeWzFP6O4) |       |          |             |
|                                                              |       |          |             |



### Assignment solution

---

#### Assignment 1

Task 1:  Code from demo of Lecture 1 & 2.



Task 2:  Shuffle the cards.

> Swift provides function for array. Add it to shuffle cards in model.
>
> Add it at the initializer of model.
>
> ```cards = cards.shuffled()
> cards = cards.shuffled()
> 
> ```



Task 3 : Adjust height and width of cards to ratio of 2:3. 

> .aspectRatop can adjust ratio in the spcae given to it. 
>
> Add it at the cards where are in the ZStack of view.
>
> ```swift
> .aspectRatio(2/3, contentMode: .fit)
> ```



Task 4: Random pairs of cards between 2 to 5 pairs.

> I declare a static let in the viewmodel to make it callable form view.
>
> ```swift
> static let random = Int.random(in: 2...5)
> ```

> Then call it at the createMemoryGame function
>
> ```swift
> static func createMemoryGame() -> MemoryGame<String> {
>         let emojis = ["😊","😁","🤪","🥳","😎","😕","🥺","🤣"]
>         return MemoryGame<String>(numberOfPairsOfCards: self.random, cardContentFactory: {(pairIndex: Int) -> String in return emojis[pairIndex]})
>     }
> ```



Task 5: Adjust font on cards if the number of piars is bigger than 5.

>```swift
>.font(EmojiMemoryGame.random == 5 ? Font.title : Font.largeTitle)
>```



Extra Credit 1: Use random emojis.

> Add .shffule() function at emoji in view model.
>
> ```swift
> let emojis = ["😊","😁","🤪","🥳","😎","😕","🥺","🤣","🤑","🤒","🤬","😤"].shuffled()
> ```



---

#### Assignemnt 2



