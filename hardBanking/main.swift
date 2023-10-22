//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
//

import Foundation



struct Queue<T: Equatable>{
    private var _defaultArray: [T] = []
    
    mutating func appEnd( _ newElement: T) {
        _defaultArray.append(newElement)
    }
    
    mutating func deleteElementInIndex(_ deleteElement: T) {
        guard !_defaultArray.isEmpty else { print("Is empty") ; return  }
        for (index,element) in _defaultArray.enumerated() {
            if element == deleteElement {
                _defaultArray.remove(at: index)
            }
        }
    }
    
    
    subscript (index : Int) -> T? {
        get {
            if index >= _defaultArray.count {
                print("Вы вышли за рамки массива")
                return nil
            } else { return _defaultArray[index] }
        }
        set {
            _defaultArray[index] = newValue!
        }
    }
    
    
}





var myCollection = Queue<Int>()

myCollection.appEnd(12)
print(myCollection[100])
