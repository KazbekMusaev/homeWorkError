//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
//

import Foundation

let even : (Int) -> Bool = { $0 % 2 == 0 }
let odd: (Int) -> Bool = { $0 % 2 != 0 }

var array = [10,2,3,4,5,6,7,8,9,10]

func filter(array: inout [Int], predice: (Int) -> Bool) -> [Int] {
    var filtred = [Int]()
    for element in array {
        if predice(element) {
            filtred.append(element)
        }
    }
    return array
}


struct MyArray<Element: Comparable> {

    var elements: [Element]

    init(_ elements: [Element]) {
        self.elements = elements
    }
    
    func sorting (_ rhs: Int) -> MyArray<Element> {
        var sort = [Element]()
        if rhs == 1 {
            sort = elements.sorted { $1 < $0 }
        } else if rhs == 0 {
            sort = elements.sorted { $0 < $1 }
        }
        return MyArray(sort)
    }
    
}



