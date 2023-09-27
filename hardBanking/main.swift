//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
//

import Foundation

//1. Функция сортировки массива
func massivBuble (_ array: [Int]) -> [Int]{
    guard array.count > 1 else {
        return array
    }
    var filter = array
    let maxNumber = array.count
    var valueTwo = Int()
    for index in 0..<maxNumber-1 {
        for value in 0..<maxNumber-index-1{
            if filter[value] > filter[value+1]{
                valueTwo = filter[value]
                filter[value] = filter[value + 1]
                filter[value + 1] = valueTwo
            }
        }
    }
    return filter
}


//2. Проверка палиндрома
func palindrome () -> Bool{
    let input = readLine()
    var example = String()
    guard let input = input else {
        return false
    }
    for i in input.reversed() {
        example += String(i)
    }
    if example == input {
        return true
    } else {
        return false
    }
}

//3. Сумма элементов массива
func arraySumm(_ array: [Int]) -> Int {
    var summ = Int()
    for i in array {
        summ += i
    }
    return summ
}

//4. Конвертация температуры
func fahrenheit(_ celcium: Float) -> Float {
    return (celcium * 9 / 5) - 32
}

//5. Записная книжка поиск по имени, почте или по номеру телефона
let userData: [String] = ["Musaev Kazbek", "musaev-2001@mail.ru", "89959000152"]

func searchUser() -> String {
    print("Введите имя и фамилию пользователя : ")
    var check: Bool = false
    let userInput = readLine()
    guard let userInput = userInput else {
        return "Error"
    }
    for i in userData {
        if i == userInput {
            check = true
        } else { check = false }
    }
    if check {
        return "Инфомация о пользователе есть"
    } else { return "Нет информации о пользователе" }
}

//6. Перестановка первого и последнего элемента массива
func rakirovka (_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let maxValue = array.count
    var filter = array
    let firstValue = array.first!
    let lastNumber = array.last!
    
    
    filter[0] = lastNumber
    filter[maxValue-1] = firstValue
    
    return filter
}


//7. Форматирование первой буквы в заглавную
//func racirovka(_ string: String) -> String {
//    var formating = string
//    formating.first?.uppercased()
//    for i in formating {
//        if i == " " {
//            formating[i].uppercased()
//        }
//    }
//}

//8. Принимаем день недели в строке и возращает числом
func monday () -> Int? {
    print("Введите день недели : ")
    let week = readLine()
    guard let week = week else {
        return nil
    }
    switch week {
    case "Понедельник":
        return 1
    case "Вторник":
        return 2
    case "Среда":
        return 3
    case "Четверг":
        return 4
    case "Пятница":
        return 5
    case "Суббота":
        return 6
    case "Воскресенье":
        return 7
    default:
        return nil
    }
}

//9. Уникальные символы


//10. Слияние массивов
func massivSumm (_ firstArray: [Int], _ secondArray: [Int]) -> [Int]{
    return firstArray + secondArray
}

//11. Подсчет гласных
func vowels(_ string: String) -> Int {
    var checkVowels = Int()
    for i in string {
        if i == "а" || i == "у" || i == "о" || i == "и" || i == "э" || i == "ы" || i == "я" || i == "ю" || i == "е" || i == "ё" {
            checkVowels += 1
        }
    }
    return checkVowels
}

//12. Проверка дубликатов в массиве

//13. Сумма всех чисел до N
func summary() -> Int? {
    print("Введите число, с которым хотите провести взаимодействие : ")
    let userInput = readLine()
    guard let userInput = userInput else {
        return nil
    }
    let maxNumber = Int(userInput)!
    var summary = Int()
    var allValue: Int = 0
    for i in 0...maxNumber{
        //сумма = первый элемент + следующий элемент
        summary = i + allValue
        allValue = summary
    }
    return summary
}

//14. Длинное слово

//15. Сокращение строки
//func ninjaString(_ string: String, _ value: Int) -> String {
//    var ninjas = string
//    let maxNumber = ninjas.count
//    for i in (0..<maxNumber) {
//
//    }
//    return ninjas
//}



//16. Объеденение двух массивов без дубликатов
//func massivPlus(_ firstArray: [Int], _ secondArray: [Int]) -> [Int]{
//    guard !firstArray.isEmpty || !secondArray.isEmpty else {
//        return firstArray + secondArray
//    }
//    var oneArray = firstArray
//    var twoArray = secondArray
//    for i in oneArray {
//        for j in twoArray {
//            if i == j {
//
//            }
//        }
//    }
//    return oneArray + twoArray
//}

//17. Количество слов заданной длины:
//Напишите функцию, которая принимает строку и число N, а затем возвращает количество слов в строке, длина которых равна N.


//18. Угадай число:
//Создайте игру, в которой компьютер случайно выбирает число между 1 и 100, а игрок пытается угадать его за минимальное количество попыток. После каждой попытки компьютер должен сообщать, была ли предыдущая догадка слишком высокой или слишком низкой.

//19. Задание: Простой шифратор и дешифратор слов с использованием замены букв
//Описание:
//Реализуйте метод шифрования, который будет заменять определенные буквы другими буквами и метод дешифрования для восстановления исходного сообщения.
//Требования:
//Создайте функцию encode, которая принимает строку и возвращает зашифрованную строку, заменяя a на z, b на y, c на x и так далее.
//Создайте функцию decode, которая принимает зашифрованную строку и возвращает исходную строку, производя обратную замену.
//Наш шифроватор будет менять значение
//a -> z , b -> y, c -> x, d -> w, e -> v, f -> u, g -> t, h -> s, i -> r, j -> q, k -> p, l -> o, m - > n, n - > 1, o -> 2, p - > 3, q -> 4, r -> 5, s -> 6, t -> 7, u -> 8, v -> 9, w -> _, x -> *, y -> &, z -> #, " " -> $
//Только не используйте здесь заглавные буквы )))))
func encode (_ string: String) -> String {
    var invis = String()
    for index in string {
        switch index {
        case "a":
            invis += "z"
        case "b":
            invis += "y"
        case "c":
            invis += "x"
        case "d":
            invis += "w"
        case "e":
            invis += "v"
        case "f":
            invis += "u"
        case "g":
            invis += "t"
        case "h":
            invis += "s"
        case "i":
            invis += "r"
        case "j":
            invis += "q"
        case "k":
            invis += "p"
        case "l":
            invis += "0"
        case "m":
            invis += "n"
        case "n":
            invis += "1"
        case "o":
            invis += "2"
        case "p":
            invis += "3"
        case "q":
            invis += "4"
        case "r":
            invis += "5"
        case "s":
            invis += "6"
        case "t":
            invis += "7"
        case "u":
            invis += "8"
        case "v":
            invis += "9"
        case "w":
            invis += "_"
        case "x":
            invis += "*"
        case "y":
            invis += "&"
        case "z":
            invis += "#"
        case " ":
            invis += "$"
        default :
            print("Can you speak human leanguage?")
        }
    }
    return invis
}


func decode(_ string: String) -> String {
    var visibl = String()
    for index in string {
        switch index {
        case "z":
            visibl += "a"
        case "y":
            visibl += "b"
        case "x":
            visibl += "c"
        case "w":
            visibl += "d"
        case "v":
            visibl += "e"
        case "u":
            visibl += "f"
        case "t":
            visibl += "g"
        case "s":
            visibl += "h"
        case "r":
            visibl += "i"
        case "q":
            visibl += "j"
        case "p":
            visibl += "k"
        case "0":
            visibl += "l"
        case "n":
            visibl += "m"
        case "1":
            visibl += "n"
        case "2":
            visibl += "o"
        case "3":
            visibl += "p"
        case "4":
            visibl += "q"
        case "5":
            visibl += "r"
        case "6":
            visibl += "s"
        case "7":
            visibl += "t"
        case "8":
            visibl += "u"
        case "9":
            visibl += "v"
        case "_":
            visibl += "w"
        case "*":
            visibl += "x"
        case "&":
            visibl += "y"
        case "#":
            visibl += "z"
        case "$":
            visibl += " "
        default :
            print("Can you speak human leanguage?")
        }
    }
    return visibl
}

