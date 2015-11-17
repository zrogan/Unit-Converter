//
//  Temperatura.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 04/11/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import Foundation

class Temperatura {
    
    static func getList() -> Array<String> {
        return ["Celsius","Kelvin","Fahrenheit"]
    }
    
    static func convertFromCelsiusToKelvin(valorTemperatura v : Double) -> Double {
        return v + 273.15
    }
    
    static func convertFromCelsiusToFahrenheit(valorTemperatura v: Double) -> Double {
        return (v * 9/5) + 32
    }
    
    static func convertFromKelvinToCelsius(valorTemperatura v : Double) -> Double {
        return v - 273.15
    }
    
    static func convertFromFahrenheitToCelsius(valorTemperatura v : Double) -> Double {
        return (v - 32) * 5/9
    }
    
    static func convertFromKelvinToFahrenheit(valorTemperatura v : Double) -> Double {
        return (v - 273.15) * 9/5 + 32
    }
    
    static func convertFromFahrenheitToKelvin(valorTemperatura v : Double) -> Double {
        return (v - 32) * 5/9 + 273.15
    }
    
    static func convert(tempOrigem o : String, tempDestino d : String, valor v:Double) ->Double{
        if o=="Fahrenheit" {
            if d=="Celsius" {
                return convertFromFahrenheitToCelsius(valorTemperatura: v)
            } else if d=="Kelvin" {
                return convertFromFahrenheitToKelvin(valorTemperatura: v)
            }
        } else if o=="Celsius" {
            if d=="Fahrenheit" {
                return convertFromCelsiusToFahrenheit(valorTemperatura: v)
            } else if d=="Kelvin" {
                return convertFromCelsiusToKelvin(valorTemperatura: v)
            }
        } else if o=="Kelvin" {
            if d=="Fahrenheit" {
                return convertFromKelvinToFahrenheit(valorTemperatura: v)
            } else if d=="Celsius" {
                return convertFromKelvinToCelsius(valorTemperatura: v)
            }
        }
        return 0.0
    }
}