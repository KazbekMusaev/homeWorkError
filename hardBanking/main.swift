//
//  main.swift
//  hardBanking
//
//  Created by apple on 19.09.2023.
//

import Foundation

print("Home Work")

let clientName : String = "Артем"

let bankRate: Double = 5

var deposit: Double = 1000
var formulaFirstYear: Double = deposit + (deposit/100*bankRate)
var rateIn1Years : Double = formulaFirstYear - deposit
var formulaSecondYear: Double = formulaFirstYear + (formulaFirstYear/100*bankRate)
var rateIn2Years : Double = formulaSecondYear - deposit
var formulaThirdYear: Double = formulaSecondYear + (formulaSecondYear/100*bankRate)
var rateIn3Years : Double = formulaThirdYear - deposit
var formulaFourthYear: Double = formulaThirdYear + (formulaThirdYear/100*bankRate)
var rateIn4Years : Double = formulaFourthYear - deposit
var formulaFifthYear: Double = formulaFourthYear + (formulaFourthYear/100*bankRate)
var rateIn5Years : Double = formulaFourthYear - deposit


print("""
      Клиент \(clientName) вложил \(deposit)р в СберБанк под \(bankRate) % годовых
      В первый год он получит \(formulaFirstYear)p, из них \(formulaFirstYear - deposit)р будут проценты по вкладу
      Во второй год \(formulaSecondYear)p, из них \(formulaSecondYear - deposit)р будут проценты по вкладу за 2 года
      В третий год \(formulaThirdYear)p, из них \(formulaThirdYear - deposit)р будут проценты по вкладу за 3 года
      В четвертый год \(NSString(format:"%.2f", formulaFourthYear))p, из них \(NSString(format:"%.2f", rateIn4Years))р будут проценты по вкладу за 4 года
      В пятый год \(NSString(format:"%.2f", formulaFifthYear))p, из них \(NSString(format:"%.2f", rateIn5Years))р будут проценты по вкладу за 5 лет
      """
)

