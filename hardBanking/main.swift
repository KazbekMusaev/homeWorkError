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
    let exit : Bool = true
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

func translateEngRus(){
    let engRusDictionary : [String:String] =
    [
    "hello":"привет","how":"как","where":"где","what":"что","friend":"друг","brother":"брат","family":"семья","home":"дом","cat":"кот","dog":"собака","cow":"корова","iphone":"айфон","live":"жизнь","like":"нравится","about":"о","in":"в","mother":"мама","father":"папа","ball":"мяч","rain":"дождь","today":"сегодня","tomorrow":"завтра","yesterday":"вчера","among":"среди","us":"нас","we":"мы","he":"он","she":"она","lion":"лев","tiger":"тигр","eagle":"орел","box":"коробка","mirror":"зеркало","link":"связь","camel":"верблюд","swift":"быстро","lonely":"одинокий","do":"делать","will":"будешь","did":"сделал","write":"писать","kod":"код","some":"некоторый","think":"думать","thing":"вещь","use":"использовать","worm":"червь","tomato":"помидор","cucumber":"огурец","strawberry":"клубника","cherry":"вишня","banana":"банан","peper":"перец","salt":"соль","sugar":"сахар","honey":"мед","short":"короткий","bear":"медведь","Dagestan":"Дагестан","have":"иметь","wear":"носить","cloth":"одежда","jaket":"куртка","gym":"спортзал","judo":"дзюдо","black":"черный","white":"белый","blue":"синий","yellow":"желтый","green":"зеленый","gray":"серый","cold":"холодно","hot":"жарко","water":"вода","fire":"огонь","litre":"литр","more":"более","happy":"счастливый","happens":"случаться","world":"мир","word":"слово","letter":"буква","viper":"гадюка","poison":"яд","park":"парк","ocean":"океан","sea":"море","earth":"земля","up":"вверх","down":"вниз","all":"все","every":"каждый","lone":"одинокий","large":"большой","little":"маленький","around":"вокруг","every where":"везде","yes":"да","not":"нет","note":"записка","book":"книга","read":"читать","weather":"погода","sun":"солнце","slow":"медленный","can":"может","maybe":"может быть","glass":"стекло","wind":"ветер","air":"воздух","element":"элемент","branch":"ветвь","hard":"трудный","blood":"кровь","fild":"поле","memory":"память","as":"как","mini":"минимум","most":"большинство","sort":"сортировка","run":"бежать","role":"роль","point":"очко","notebook":"блокнот","library":"библиотека","river":"река","kotlin":"котлин","bubble":"пузырь","cofe":"кофе","tea":"чай","directory":"каталог","dictionary":"словарь","set":"набор","complex":"сложный","milk":"молоко","motivation":"мотивация"
    ]
    
    
    func searchWord (engWord : String) -> String? {
        return engRusDictionary[engWord]
    }
    
    print("Добро пожаловать в Англо-Русский словарь 📖")
    print("Для выхода из программы напечатайте \"Exit\"")
    while true{
        print("Введите слово, которое вы хотите перевести : ")
        let getWord = readLine() ?? "0"
        if getWord == "Exit" { break }
        if let translateWord = searchWord(engWord: getWord){
            print("\(translateWord)")
        } else {
            print("В словаре нет перевода данного слова")
        }
    }
}


//4. Справочник по странам
// Функционал поиск стран, добавления города для страны, просмотр городов по странам, удаления города из страны

func citiesInCountries(){
    let info: String =   """
                            Приложение является авторской разработкой, и не терпит плагиата😂
                            Приложение показывает названия стран и городов на английском языке🤐
                            Если вы не знаете англисйкий, разработчик не виноват(вы можете использовать словарь📖)🤫
                            Добавляйте города только на английском языке🏴󠁧󠁢󠁥󠁮󠁧󠁿
                            В случае нарушение правил предусмотрены санкции💸
                            Не задавайтесь вопросом почему здесь всего 13 стран🤔
                            У разработчика мало времени на сдачу домашней работы⏳
                            """
    var citiesDictionary: [String:Set<String>] = [
        "Russian":["Moscow","Saint Pitersburg","Kazan","Mahachkala"],
        "Spain":["Madrid","Barselona","Valencia","Sevilia","Palma"],
        "Germany":["Berlin","Hamburg","Munchen","Koln","Stuttgart"],
        "Croatia":["Zagred","Split","Rijeka"],
        "China":["Beijing","Tianjin","Shanghai"],
        "Australia":["Canberra"],
        "Armenia":["Yerevan"],
        "Bahrain":["Manama"],
        "Belarus":["Minsk"],
        "Belgium":["Brussels"],
        "Brazil":["Brasillia"],
        "Canade":["Ottawa"],
        "Chile":["Santiago"]
    ]
    print("Добро пожаловать в справочник городов 🌇")
    
    
    
    while true {
        print("""
               
               1. Просмотр городов страны
               2. Добавление города, для определенной страны
               3. Удаление города из страны
               4. Закрыть приложение
               5. Информация пользования
               
               """)
        let userChoice = readLine() ?? "Ошибка ввода"
        if userChoice == "4" { break }
        else if userChoice == "1" {
            print("""
                    Choice country :
                    1. Russian
                    2. Spain
                    3. Germany
                    4. Croatian
                    5. China
                    6. Australia
                    7. Armenia
                    8. Bahrain
                    9. Belarus
                    10. Belgium
                    11. Brazil
                    12. Canade
                    13. Chile
                    """)
            let userChoiceCountry = readLine() ?? "0"
            switch userChoiceCountry{
            case "1":
                print(citiesDictionary["Russian"] ?? "Not have city")
            case "2":
                print(citiesDictionary["Spain"] ?? "Not have city")
            case "3":
                print(citiesDictionary["Germany"] ?? "Not have city")
            case "4":
                print(citiesDictionary["Croatian"] ?? "Not have city")
            case "5":
                print(citiesDictionary["China"] ?? "Not have city")
            case "6":
                print(citiesDictionary["Ausralia"] ?? "Not have city")
            case "7":
                print(citiesDictionary["Armenia"] ?? "Not have city")
            case "8":
                print(citiesDictionary["Bahrain"] ?? "Not have city")
            case "9":
                print(citiesDictionary["Belarus"] ?? "Not have city")
            case "10":
                print(citiesDictionary["Belgium"] ?? "Not have city")
            case "11":
                print(citiesDictionary["Brazil"] ?? "Not have city")
            case "12":
                print(citiesDictionary["Canade"] ?? "Not have city")
            case "13":
                print(citiesDictionary["Chile"] ?? "Not have city")
            default:
                print("Error choice")
            }
        } else if userChoice == "2" {
            print("""
                    Choice country :
                    1. Russian
                    2. Spain
                    3. Germany
                    4. Croatian
                    5. China
                    6. Australia
                    7. Armenia
                    8. Bahrain
                    9. Belarus
                    10. Belgium
                    11. Brazil
                    12. Canade
                    13. Chile
                    """)
            let userChoiceCountry = readLine() ?? "0"
            print("Please input name of citi")
            let userInputNewCiti = readLine() ?? "0"
            switch userChoiceCountry{
            case "1":
                citiesDictionary["Russian"]?.insert(userInputNewCiti)
            case "2":
                citiesDictionary["Spain"]?.insert(userInputNewCiti)
            case "3":
                citiesDictionary["Germany"]?.insert(userInputNewCiti)
            case "4":
                citiesDictionary["Croatian"]?.insert(userInputNewCiti)
            case "5":
                citiesDictionary["China"]?.insert(userInputNewCiti)
            case "6":
                citiesDictionary["Australia"]?.insert(userInputNewCiti)
            case "7":
                citiesDictionary["Armenia"]?.insert(userInputNewCiti)
            case "8":
                citiesDictionary["Bahrain"]?.insert(userInputNewCiti)
            case "9":
                citiesDictionary["Belarus"]?.insert(userInputNewCiti)
            case "10":
                citiesDictionary["Belgium"]?.insert(userInputNewCiti)
            case "11":
                citiesDictionary["Brazil"]?.insert(userInputNewCiti)
            case "12":
                citiesDictionary["Canade"]?.insert(userInputNewCiti)
            case "13":
                citiesDictionary["Chile"]?.insert(userInputNewCiti)
            default:
                print("Error choice")
            }
        } else if userChoice == "3"{
            print("""
                    Choice country :
                    1. Russian
                    2. Spain
                    3. Germany
                    4. Croatian
                    5. China
                    6. Australia
                    7. Armenia
                    8. Bahrain
                    9. Belarus
                    10. Belgium
                    11. Brazil
                    12. Canade
                    13. Chile
                    """)
            let userChoiceCountry = readLine() ?? "0"
            switch userChoiceCountry{
            case "1":
                print(citiesDictionary["Russian"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Russian"]?.remove(userDeleteCity)
            case "2":
                print(citiesDictionary["Spain"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Spain"]?.remove(userDeleteCity)
            case "3":
                print(citiesDictionary["Germany"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Germany"]?.remove(userDeleteCity)
            case "4":
                print(citiesDictionary["Croatian"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Croatian"]?.remove(userDeleteCity)
            case "5":
                print(citiesDictionary["China"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["China"]?.remove(userDeleteCity)
            case "6":
                print(citiesDictionary["Ausralia"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Australia"]?.remove(userDeleteCity)
            case "7":
                print(citiesDictionary["Armenia"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Armenia"]?.remove(userDeleteCity)
            case "8":
                print(citiesDictionary["Bahrain"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Bahrain"]?.remove(userDeleteCity)
            case "9":
                print(citiesDictionary["Belarus"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Belarus"]?.remove(userDeleteCity)
            case "10":
                print(citiesDictionary["Belgium"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Belgium"]?.remove(userDeleteCity)
            case "11":
                print(citiesDictionary["Brazil"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Brazil"]?.remove(userDeleteCity)
            case "12":
                print(citiesDictionary["Canade"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Canade"]?.remove(userDeleteCity)
            case "13":
                print(citiesDictionary["Chile"] ?? "Not have city")
                print("Which you want delete?")
                let userDeleteCity = readLine() ?? "Error Delete"
                citiesDictionary["Chile"]?.remove(userDeleteCity)
            default:
                print("Error choice")
            }
        } else if userChoice == "5"{
            print("\(info)")
        }
    }
}   






