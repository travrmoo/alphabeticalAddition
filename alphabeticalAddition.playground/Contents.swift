import UIKit

//extension to convert value from 1 to 26 to corresponding alphabet value
extension Int {
    var associatedCharacter: Character? {
        guard 1...26 ~= self, let unicodeScalar = UnicodeScalar(64 + self) else { return nil }
        return Character(String(unicodeScalar).lowercased())
    }
}

func addLetters(_ letters: [Character]) -> Character {
    
    let letterString = String(letters)
    var newArr = [Int]()
// converts letter to UTF8 value
    for character in letterString.utf8 {
        let stringSegment: String = "\(character)"
        let anInt: Int = Int(stringSegment) ?? 0
        newArr.append(anInt)
    }
    var finalValue = newArr.map {$0 - 96}.reduce(0,+)
    
//overflow logic
   if finalValue >= 26 {
     finalValue = finalValue % 26
 }
    return finalValue.associatedCharacter ?? "z"
}
