//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
//

import Foundation

//Функция определяющая четность числа
func parity (value : Int){
    if value % 2 == 0 {
        print ("Число \(value) четное")
    } else {
        print("Число \(value) не четное")
    }
}
parity(value: 4)

//Функция определяющая делимость на 3
func divisibiliy (value : Int){
    if value % 3 == 0{
        print("Число \(value) делится на 3 без остатка")
    } else {
        print("Число \(value) делится на 3 с остатком")
    }
}
divisibiliy(value: 6)

//Создаем возрастающий массив из 100 чисел
var riseMassiv: [Int] = Array(1...100)

//Удаляем из массива четные и числа делящиеся на 3

for index in (0..<riseMassiv.count).reversed(){
    if riseMassiv[index] % 2 == 0 || riseMassiv[index] % 3 == 0 {
        riseMassiv.remove(at: index)
    }
}

//Добавляем 50 чисел фибоначи
func fibonachi (f : Int) -> Int {
    if f <= 2 { return 1 }
    else {
        return fibonachi(f: f - 1) + fibonachi(f: f - 2)
    }
}

print(fibonachi(f: 3))
