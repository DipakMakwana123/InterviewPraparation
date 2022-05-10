import UIKit

var greeting = "Hello, playground"


/*
 
 Find the corresponding indexs from array where Sum of index's value should be target numnber.
 
 Input : [3,4,5,6,7,9]
 
 Target Value = 11
 
 OutPut: [2,3]
 
 */


func findIndexFromArray(arr:[Int], targetVal:Int) -> [Int]{
    
    var nextIndex = 0
    
    if arr.isEmpty {
        return [0,0]
    }
    debugPrint(arr.count)
    
    for (index,num) in arr.enumerated() {
        let val1 = arr[index]
        let val2 = arr[index + 1]
        debugPrint(index+1)
        if val1 + val2 == targetVal {
            return [index,index+1]
        }
    }
    
    return [0,0]
}

findIndexFromArray(arr:[3,4,5,6,7,9],targetVal: 11)
findIndexFromArray(arr:[3,4,5,6,7,9],targetVal: 16)
findIndexFromArray(arr:[3,4,5,6,7,9],targetVal: 3)
