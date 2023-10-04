//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
//

import Foundation

// 1. Времена года и температура

enum SeasonOfYears {
    case winter, spring, summer, fall
    
    
    func middleTemperature () -> Int {
        switch self {
        case .fall:
            return 17
        case .spring:
            return 14
        case .summer:
            return 29
        case .winter:
            return 6
        }
    }
    
    var translate : String {
        switch self {
        case .winter:
           return "Зима"
        case .spring:
           return "Весна"
        case .summer:
           return "Лето"
        case .fall:
           return "Осень"
        }
    }
    
    var computeProperty : String{
        switch self {
        case .winter:
            return "Средняя температура в \(translate) состовлеяет \(middleTemperature())"
        case .spring:
            return "Средняя температура в \(translate) состовлеяет \(middleTemperature())"
        case .summer:
            return "Средняя температура в \(translate) состовлеяет \(middleTemperature())"
        case .fall:
            return "Средняя температура в \(translate) состовлеяет \(middleTemperature())"
        }
    }
    
}

// 2. Информация о транспортных средствах

enum Transport {
    case bike, airplane
    enum Automobile{
        case sedan,bus,crossover,jeep,sportcar
        var maxSpeed: String {
            switch self{
            case .sedan:
                return "300 км/ч"
            case .bus:
                return "90 км/ч"
            case .crossover:
                return "280 км/ч"
            case .jeep:
                return "220 км/ч"
            case .sportcar:
                return "360 км/ч"
            }
        }
    }
    enum Train{
        case passanger, express
        var maxSpeed: String {
            switch self{
            case .passanger:
                return "140 км/ч"
            case .express:
                return "330 км/ч"
            }
        }
    }
    
    var maxSped: String{
        switch self {
        case .bike:
            return "40 км/ч"
        case .airplane:
            return "400 км/ч"
        }
    }
}

func searchMaxSpeed(){
    let bike = Transport.bike
    let airplane = Transport.airplane
    print("Вы вошли в базу максимальных скоростей транспорта🚀")
    print("Программа определит максимальную скорость вашего транспорта")
    print("Выберите транспорт : ")
    print("1.Автобиль\n2.Велосипед\n3.Самолет\n4.Поезд")
    let userChoice = readLine() ?? "Error Choice"
    switch userChoice{
    case "1":
        print("Какой вид автомобиля у вас?\n1.Седан\n2.Автобус\n3.Кроссовер\n4.Джип\n5.Спорткар")
        let userChoice2 = readLine() ?? "Error Choice Avto"
        switch userChoice2{
        case "1":
            let userAvto = Transport.Automobile.sedan
            print(userAvto.maxSpeed)
        case "2":
            let userAvto = Transport.Automobile.bus
            print(userAvto.maxSpeed)
        case "3":
            let userAvto = Transport.Automobile.crossover
            print(userAvto.maxSpeed)
        case "4":
            let userAvto = Transport.Automobile.jeep
            print(userAvto.maxSpeed)
        case "5":
            let userAvto = Transport.Automobile.sportcar
            print(userAvto.maxSpeed)
        default:
            print("Error")
        }
    case "2":
        print(bike.maxSped)
    case "3":
        print(airplane.maxSped)
    case "4":
        print("Какой поезд вы иметее в виду?\n1.Пассажирский\n2.Скоростной")
        let userChoice2 = readLine() ?? "Error Choice Avto"
        switch userChoice2{
        case "1":
            let userTrain = Transport.Train.passanger
            print(userTrain.maxSpeed)
        case "2":
            let userTrain = Transport.Train.express
            print(userTrain.maxSpeed)
        default:
            print("Error")
        }
    default:
        print("Error")
    }
}


// 3. Статус платежа

let toDay = Date()
// Создаем и настраиваем форматор дат
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .short
dateFormatter.timeStyle = .full
let dateString = dateFormatter.string(from: toDay)

func howMuchPay() -> String{
    print("Введите сумму которую хотите перевести : ")
    let moneyValue = readLine() ?? "Error"
    return moneyValue
}

enum PaymentStatuse{
    case notPaid, inProccesing, paid(Int), paymentError
    
    var payInformation: String {
        switch self {
        case .notPaid:
            return "Не оплачено"
        case .inProccesing:
            return "В процессе оплаты"
        case .paid(let howMuch):
            return "\(howMuch) рублей оплачено \(dateString)"
        case .paymentError:
            return payStatuseError()
        }
    }
}

func payStatuseError() -> String {
    let notHaveMoney = "На счету не достаточно средств"
    let errorServer = "Временно не работает сервер"
    
    let isBecouse = Bool.random()
    
    return isBecouse ? notHaveMoney : errorServer
}

let pay = PaymentStatuse.paid(100)
print(pay.payInformation)


// 4. Рекомендации по режимама камеры

enum CameraMode{
    case auto, portret, landshaft, night
    
    var recomedationForUse: String{
        switch self {
        case .auto:
            return "Авторежим, не нужно ничего настраивать, фоткайте уверенно"
        case .portret:
            return "Держите камеру чуть дольше, для улучшения фокуса"
        case .landshaft:
            return "Снимает задний фон, и дальние объекты"
        case .night:
            return "Ночной режим с долгой выдержкой. Держите камеру на объекте, не отводите сразу"
        }
    }
}

let cameraUser = CameraMode.night


// 5. Диеты животных в зоопарке
enum AnimalType{
    case predator, herbivore, insect
    
    var whatEat : [String] {
        switch self {
        case .predator:
            return ["Рыба","Мясо"]
        case .herbivore:
            return ["Трава","Растения","Фрукты","Овощи"]
        case .insect:
            return ["Трава","Останки"]
        }
    }
}

let lion = AnimalType.predator
print(lion.whatEat)

// 6. Отслеживать статус заказа в ресторане

enum OrderStatuse{
    case accepted, gettingReady, ready, delivered
    var translate: String{
        switch self {
        case .accepted:
            return "Принят"
        case .gettingReady:
            return "Готовится"
        case .ready:
            return "Готов"
        case .delivered:
            return "Доставляется"
        }
    }
    var alacrity: OrderStatuse {
        switch self {
        case .accepted:
            print("Ваш заказ \n\(translate)\nСледующий статус")
            return .gettingReady
        case .gettingReady:
            print("Ваш заказ \n\(translate)\nСледующий статус")
            return .ready
        default:
            print("Ваш заказ \n\(translate)\nСледующий статус")
            return .delivered
        }
    }
}

let order = OrderStatuse.gettingReady
print(order.alacrity.translate)

// 7. Информация о номерах в отеле

enum RoomType{
    case single, luxury, double
    
    var price : String{
        switch self {
        case .single:
            return "Этот номер самый дешевый - 20$ сутки"
        case .luxury:
            return "Этот самый дорогой номер - 190$ сутки"
        case .double:
            return "Стоимость 2местного номера - 100$ сутки"
        }
    }
    
    var booking : String{
        switch self {
        case .single:
            return "В данный момент свободно 3 номера"
        case .luxury:
            return "В данный момент свободно 19 номеров"
        case .double:
            return "В данный момент свободно 10 номеров"
        }
    }
}

let yourRoom = RoomType.double
print("\(yourRoom.booking).\(yourRoom.price)")

// 8. Уровни сложности в игре
enum DifficultyLevel{
    case easy, middle, hard, master
    
    var enemyStrong: String{
        switch self {
        case .easy:
            return "Слабые мобы"
        case .middle:
            return "Мобы средней сложности"
        case .hard:
            return "Мобы сильные, умеют адаптироваться, также могут пользоваться навыками и магией"
        case .master:
            return "Самые сильные мобы, обладают искусственным интелектом. Могут предсказывать действия пользователя на основе его игры. Мобы могут телепортироваться, также обладают устойчевостью к погодным условиям"
        }
    }
    var enemyMuch: String{
        switch self {
        case .easy:
            return "Мобов 3-4 в одной локации"
        case .middle:
            return "10-15 Мобов в одной локации"
        case .hard:
            return "30-40 Мобов в одной локации"
        case .master:
            return "Мобы повсюду"
        }
    }
    var leadTime: String {
        switch self {
        case .easy:
            return "На каждом уровне у вас 5 минут"
        case .middle:
            return "На каждом уровне 3 минуты"
        case .hard:
            return "На каждом уровне у вас 2 минуты"
        case .master:
            return "Нет ограничений по времени"
        }
    }
}

let gamerDifficulty = DifficultyLevel.easy
print("\(gamerDifficulty.enemyMuch).\(gamerDifficulty.enemyStrong).\(gamerDifficulty.leadTime)")


// 9. Прогноз погоды по облачности
enum Cloudiness{
    case ясно, частичнаяОблачность, облачно, пасмурно
    
    var probability : String{
        switch self {
        case .ясно:
            return "Вероятность дождя 0-5%"
        case .частичнаяОблачность:
            return "Вероятность дождя 15-30%"
        case .облачно:
            return "Вероятность дождя 30-40%"
        case .пасмурно:
            return "Вероятнотсь дождя 50-70%"
        }
    }
}

let wether = Cloudiness.облачно
print(wether.probability)

// 10. Цена напитков в автомате

enum DrinkType{
    case coffee, tea, hotChokolate, water
    
    var price : Int {
        switch self {
        case .coffee:
            return 150
        case .tea:
            return 100
        case .hotChokolate:
            return 120
        case .water:
            return 70
        }
    }
    
    var translate: String{
        switch self {
        case .coffee:
            return "Кофе"
        case .tea:
            return "Чай"
        case .hotChokolate:
            return "Горячий шоколад"
        case .water:
            return "Вода"
        }
    }
    
    var priceInfo : String{
        switch self {
        case .coffee:
            return "\(translate) стоит \(price)"
        case .tea:
            return "\(translate) стоит \(price)"
        case .hotChokolate:
            return "\(translate) стоит \(price)"
        case .water:
            return "\(translate) стоит \(price)"
        }
    }
}

let drink = DrinkType.coffee
print(drink.priceInfo)
