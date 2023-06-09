import UIKit

var greeting = "Hello,playground"

//Removing duplicates and printing from string
func removeDuplicates(input: String) -> (String,String)?  {
    var uniqueArrray: [Character] = []
    var duplicateValues: [Character] = []
    for char in input {
        if !uniqueArrray.contains(char) {
            uniqueArrray.append(char)
        } else {
            duplicateValues.append(char)
        }
    }
    
    return (String(uniqueArrray),String(duplicateValues))
}
let unique = removeDuplicates(input: greeting)
if let str = unique?.1 {
    let set = Set(str)
//    debugPrint("\(set)")
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////

// Find min and max values
func findMaxMinValues(input: [Int]) -> (Int,Int) {
    var min  = input[0]
    var max = min
    
    for value in input {
        if value <  min {
            min = value
        }
        if value > max {
            max = value
        }
    }
    return (min,max)
}
//debugPrint(findMaxMinValues(input: [2,4,1,6,9]))
///////////////////////////////////////////////////////////////////////////////////////////////////////////


//Filter the unique Values or find duplicate values
func filterUniqeValues( name: String) -> String? {
    var uniqueCharacters = ""
    var input = name
    for char in input {
        if !uniqueCharacters.contains(char) {
            uniqueCharacters.append(char)
        } else {
            input.removeAll{$0 == char}
        }
    }
    return input
}
if let value = filterUniqeValues(name: "Helloplayground") {
//    debugPrint(value)
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
//Soring Array
func sortValues(input: inout [Int]) -> [Int] {
    var sortArray: [Int] = []
    var count = input.count
    
    for _ in 0..<count {
        for j in 0..<count-1 {
            if input[j] > input[j+1] {
                let temp = input[j]
                input[j] = input[j+1]
                input[j+1] = temp
            }
        }
    }
    
    sortArray = input
    
    return sortArray
}
var input = [2,4,1,6,9]
sortValues(input: &input)

///////////////////////////////////////////////////////////////////////////////////////////////////////////

//Find the two index value as given target
func findTwoIndices(array: [Int], sTarget: Int,aTarget: Int) -> (Int, Int)? {
    var intialIndex = 0
    for i in 0..<array.count {
        intialIndex += 1
        for j in intialIndex..<array.count {
            // for subtractValue
            let subtractvalue = array[j] - array[i]
            if subtractvalue == sTarget {
//                print("subtractvalues --->\(i),\(j)")
            }
            // for additionValue
            let additionvalue = array[j] + array[i]
            if additionvalue == aTarget {
//                print("additionvalue --->\(i),\(j)")
            }
        }
    }
    return nil
}

if let values = findTwoIndices(array: [1,4,6,2,7,8], sTarget: 2, aTarget: 9) {
//    debugPrint(values)
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
///Reversing string
func reverseString(input: String) {
    var arr: [Character] = []
    
    for char in input {
        arr.insert(char, at: 0)
    }
    print(String(arr))
}

reverseString(input: "Hello World!")

///////////////////////////////////////////////////////////////////////////////////////////////////////////
///Priniting fibnoc numbers upto n Number

func printFibnocNumbers(target: Int) {
    var fibSequence = [0,1]
    var startIndex = 2
    var sequence = [0,1]

    while fibSequence[startIndex-1] + fibSequence[startIndex-2] <= target {

        let next = fibSequence[startIndex-1] + fibSequence[startIndex-2]
        fibSequence.append(next)
        startIndex += 1
    }
    //Using For Loop
    for i in 2...target {
        let value = sequence[i-1] + sequence[i-2]
        if value <= target {
            sequence.append(value)
        } else {
            break
        }
    }
    print(sequence)
    print(fibSequence)

}

printFibnocNumbers(target: 100)

///////////////////////////////////////////////////////////////////////////////////////////////////////////
