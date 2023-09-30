//
//  main.swift
//  hardBanking
//
//  Created by apple on 30.09.2023.
//

import Foundation



//1. Календарь. Необходимый функционал :
//   Возможность добавления даты, события и тд. Отображения событий

var dates = [String:[String]]() // Создаем словарь(dictionary), где ключ это строка, а значение это массив строк
func searchFromDate(date string: String) -> [String]? { // Проверяем словарь на значение по ключу
    return dates[string]
}

func calendare() -> Bool? {
    print("Добро пожаловать 🫶🏽 в календарь 🗓️")
    var exit : Bool = true
    print("Для выхода из программы введите \"Exit\" вместо даты")

    while exit {
        print("Введите дату для проверки : ")
        let userMainInputOptinal = readLine()
        guard let userMainInput = userMainInputOptinal else { return nil }
        if userMainInput == "Exit" { break }
        if let haveOrNot = searchFromDate(date:userMainInput) { // Если в словаре есть значение, то выводим его на консоль
            print("В дату 15.04, произошли следующие события : \(haveOrNot)")
        } else { // Если в словаре отсутствует значение, то добавляем его
            print("Нет событий в данную дату")
            print("Вы хотите добавить событие ?")
            let userChoice = readLine()
            if let userChoice = userChoice { // Выбор пользователя
                if userChoice == "Да" || userChoice == "да" || userChoice == "Yes" { // Положительный выбор
                    print("Выберите дату (Месяц.День) таким образом")
                    let newDateOptinal = readLine() // Ввод даты пользователем
                    if let newDate = newDateOptinal { // Проверка на отсутствие нулевого значения
                        print("Введите событие : ")
                        let newEventOptinal = readLine() // Ввод события в эту дату
                        if let newEvent = newEventOptinal {
                            var newEmptyElements = [String]()
                            let separatedEvent = newEvent.split(separator: " ")
                            for element in separatedEvent{
                                newEmptyElements.append(String(element))
                            }
                            dates[newDate] = newEmptyElements // Добавления в словарь ключа(даты) и значение(массив событий)

                        } else { print("Error Event")}
                    } else { print("Error Date") }
                } else if userChoice == "Нет" || userChoice == "нет" || userChoice == "Not"{ // Отрицательный выбор
                    print("Событие не будет добавлено")
                }
            }
        }
    }
    return nil
}

// Почему возврашется у нас значение в функции, хотя тут это не нужно было.
// Это сделанно специально, для того чтобы, можно было использовать условие guard вместо if


//2. Хранилище настроек


func settingInstall(){
    var settingsDictionary : [String:String] = ["Авиарежим":"Off", "Wi-Fi":"On", "Bluetooth":"Off", "VPN":"On", "Notifications":"Off", "Sounds":"Off"]
    
    print("Добро пожаловать в управление настройками ⚙️ ")
    print("Если хотите завершить выполнения программы введите \"Exit\"")
    
    func checkSettings (_ setting: String) -> String? { // функция проверки ключа в словаре с возвратом значения
        return settingsDictionary[setting]
    }
    
    
    let closeFunction : Bool = true // Создаем переменную для проверки остановки приложения
    
    while closeFunction {
        print("Введите настройку, которую хотите поменять : ")
        let userInputOptional = readLine() //Ввод пользователя
        if let userInput = userInputOptional { // Проверка на отсутсвие nill
            if userInput == "Exit"{ break }
            else if let haveOrNote = checkSettings(userInput){ // Проверка на наличие элементов в словаре
                if haveOrNote == "Off"{
                    print("У вас выключена данная функция")
                    print("Введите \"Да\", если вы хотите ее включить")
                    let inputYes = readLine()
                    if let inputYes = inputYes {
                        if inputYes == "Да"{
                            settingsDictionary[userInput] = "On"
                        }
                    }
                } else if haveOrNote == "On"{
                    print("У вас включена данная настройка")
                    print("Введите \"Да\", если хотите ее выключить")
                    let inputYes = readLine()
                    if let inputYes = inputYes{
                        if inputYes == "Да"{
                            settingsDictionary[userInput] = "Off"
                        }
                    }
                }
            } else { print("Такой настройки нет!") }
        }
    }
}


//3. Простой англо-русский словарь









