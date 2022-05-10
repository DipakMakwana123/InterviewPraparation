//
//  DSAViewController.swift
//  InterviewPreparation
//
//  Created by Dipakbhai Valjibhai Makwana on 06/05/22.
//

import UIKit

class DSAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // findIndexFromArray(arr:[3,4,5,6,7,9],targetVal: 11)
        //findIndexFromArray(arr:[3,4,5,6,7,9],targetVal: 16)
       // let result = findIndexFromArray(arr:[3,4,-5,6,7,9],targetVal: -1)
        let result = findIndexFromArray(arr:[3,4,-5,6,7,9],targetVal: 3)
        debugPrint(result)
        if result.isEmpty {
            debugPrint("Something is wrong")
        }
        let _ = generateFibonaciiSeries(num: 9)
        let _ = binarySearch(arr: [2,4,6,5,7,1,8,9,11,12], searchVal: 5)
        
    }
    
    /*
     
     Find the corresponding indexs from array where Sum of index's value should be target numnber.
     
     Input : [3,4,5,6,7,9]
     
     Target Value = 11
     
     OutPut: [2,3]
     
     */
    func findIndexFromArray(arr:[Int], targetVal:Int) -> [Int]{
        let  indexArr:[Int] = []
        guard !arr.isEmpty else {return indexArr}
        debugPrint(arr.count)
        for (index,num) in arr.enumerated() {
            let val1 = arr[index]
            if index + 1 < arr.count {
                let val2 = arr[safe:index + 1]
                debugPrint(index+1, num)
                if let val2 = val2 , val1 + val2 == targetVal {
                    return   [index,index+1]
                }
            }
        }
        
        return []
    }
    
    private func sortedArr(arr:inout [Int]){
        var maxValue = 0
       // var resultArr = arr
        for (index,num) in arr.enumerated() {
            //maxValue = num
            if num > maxValue {
                maxValue = num
            }
        }
    }
    
    private func binarySearch(arr:[Int],searchVal:Int){
        
    }
    
    func generateFibonaciiSeries(num:Int){
        var fiboArr: [Int] = [Int]()
        var val1 = 0
        var total = 1
       
        for _ in 0...num {
            fiboArr.append(total)
            let temp = val1
            val1 = total
            total = temp + val1
        }
        debugPrint(fiboArr)
    }
}


enum MathError : Error {
    case divideByZero
}

class DivideTwoNumber {

    /*
     func divide(dividend: Int, divisor: Int) throws -> Int  {

         if(dividend == 0){
             return 0
         }

         if(divisor == 0){
             throw MathError.divideByZero
         }

         let isNegative = (dividend < 0) || (divisor < 0)
         var quotient = 0
         var tempDivident = convertToPositiveInteger(value: dividend)
         let tempDivisor = convertToPositiveInteger(value: divisor)

         while tempDivident >= tempDivisor {
             tempDivident = tempDivident - tempDivisor
             quotient = quotient + 1
         }

         if(isDividentAndDivisorBothNegative(dividend: dividend, divisor: divisor)){
             return quotient
         }

         return isNegative ? -quotient : quotient
     }
     */
    
    
    func divide(dividend: Int, divisor: Int) throws -> Int  {

        if(dividend == 0){
            return 0
        }

        if(divisor == 0){
            throw MathError.divideByZero
        }

        let isNegative = (dividend < 0) || (divisor < 0)
        var quotient = 0
        var tempDivident = abs(dividend)//convertToPositiveInteger(value: dividend)
        let tempDivisor = abs(divisor)//convertToPositiveInteger(value: divisor)

        while tempDivident >= tempDivisor {
            tempDivident = tempDivident - tempDivisor
            quotient = quotient + 1
        }

        if(isDividentAndDivisorBothNegative(dividend: dividend, divisor: divisor)){
            return quotient
        }

        return isNegative ? -quotient : quotient
    }

    private func convertToPositiveInteger(value: Int) -> Int {
        return value < 0 ? value * -1 : value
    }

    private func isDividentAndDivisorBothNegative(dividend: Int, divisor: Int) -> Bool{
        return (dividend < 0) && (divisor < 0)
    }
}

class Sorting {
    
    func sortArr<T:Comparable>(arr:[T]) -> [T] {
        var tempArr = arr
        var resultArr = [T]()
        while resultArr.count != arr.count {
            resultArr = findMinValue(arr: &tempArr, resultArr: &resultArr)
        }
        return resultArr
    }
    private func findMinValue<T:
    Comparable>(arr:inout[T],resultArr: inout[T]) -> [T]{
        if arr.isEmpty {
            return []
        }
        var minVal = arr[0]
        var minNumberIndex = 0
        for (index,num) in arr.enumerated() {
            if num < minVal {
                minNumberIndex = index
                minVal = num
            }
        }
        resultArr.append(minVal)
        if arr.count > minNumberIndex {
            arr.remove(at: minNumberIndex)
        }
        return resultArr
    }
}
class SearchAlgoritham {
    
    func binarySearch(arr:inout [Int]){
        
    }
}
