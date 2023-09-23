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

//Функция определяющая делимость на 3
func divisibiliy (value : Int){
    if value % 3 == 0{
        print("Число \(value) делится на 3 без остатка")
    } else {
        print("Число \(value) делится на 3 с остатком")
    }
}

//Создаем возрастающий массив из 100 чисел
var riseMassiv: [Int] = Array(1...100)

//Удаляем из массива четные и числа делящиеся на 3

for index in (0..<riseMassiv.count).reversed(){
    if riseMassiv[index] % 2 == 0 || riseMassiv[index] % 3 == 0 {
        riseMassiv.remove(at: index)
    }
}


//Написали формулу фибоначи
func fibonachi (f : Int) -> Int {
    if f <= 2 { return 1 }
    else {
        return fibonachi(f: f - 1) + fibonachi(f: f - 2)
    }
}

//Добавляем формулу в цикл и добавляем эти значения в массив
//for i in 0...50 {
//    riseMassiv.append(fibonachi(f: i))
//}

//Создать калькулятор
func calculate (value1: Int, operand: String, value2: Int) {
    if operand == "+"{
        print(value1 + value2)
    } else if operand == "-" {
        print(value1 - value2)
    } else if operand == "*" {
        print(value1 * value2)
    } else if operand == "/" {
        print(value1 / value2)
    } else {
        print("Введите правильные значения!")
    }
}


// Функция которая определяет длину строки
func stringRangeMeter (string: String){
    print(string.count)
}


// Функция которая определяет максимальные числа из 3
func searchMaxNumber (value1: Int, value2: Int, value3: Int){
    if value1 > value2 || value1 > value3{
        print("Value one is BIGGER")
    } else if value2 > value1 || value2 > value3{
        print("Value two is BIGGER")
    } else {
        print("Value three is BIGGER")
    }
}


// Функция конверсирования времени
func timeConvers (sec: Int){
    var minute: Int
    var hour: Int
    if sec >= 86400 {
      print("Исправьте ваши часы!")
    } else if sec <= 60 {
        print("00h:00m:\(sec)s")
    } else if sec <= 3600 {
        minute = sec / 60
        print("00h:\(minute)m:\(sec - minute * 60)s")
    } else {
        minute = sec / 60
        if minute >= 60 {
            hour = minute / 60
            print("\(hour)h:\(minute - hour * 60)m:\(sec - minute * 60)s")
        }
    }
}

// Функция подсчета количества слов в строке
func wordMetter(string: String){
    let word = string.split(separator: " ")
    print(word.count)
}
 

// Функция которая выводит каждое слово в новой строке

// Функция которая выведит каждое слово через определенный интервал времени.

// Функция которая выведет количество слов в введенной строке

// Реверс строки
func renameString (string: String) {
}

renameString(string: "Hello")
