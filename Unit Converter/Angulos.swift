//
//  Angulos.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 25/12/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import Foundation

class Angulo {
    
    static var π = M_PI
    
    static func getList() -> Array<String> {
        return ["Grau","Radiano","Minuto"]
    }
    
    static func convertFromGrauToRadiano(valorTemperatura v : Double) -> Double {
        return v * π / 180
    }
    
    static func convertFromGrauToMinuto(valorTemperatura v: Double) -> Double {
        return v * 60
    }
    
    static func convertFromRadianoToGrau(valorTemperatura v : Double) -> Double {
        return v * 180 / π
    }
    
    static func convertFromMinutoToGrau(valorTemperatura v : Double) -> Double {
        return v / 60
    }
    
    static func convertFromRadianoToMinuto(valorTemperatura v : Double) -> Double {
        return v * 180 / π * 60
    }
    
    static func convertFromMinutoToRadiano(valorTemperatura v : Double) -> Double {
        return v / 60 * π / 180
    }
    
    static func convert(tempOrigem o : String, tempDestino d : String, valor v:Double) ->Double{
        if o=="Minuto" {
            if d=="Grau" {
                return convertFromMinutoToGrau(valorTemperatura: v)
            } else if d=="Radiano" {
                return convertFromMinutoToRadiano(valorTemperatura: v)
            }
        } else if o=="Grau" {
            if d=="Minuto" {
                return convertFromGrauToMinuto(valorTemperatura: v)
            } else if d=="Radiano" {
                return convertFromGrauToRadiano(valorTemperatura: v)
            }
        } else if o=="Radiano" {
            if d=="Minuto" {
                return convertFromRadianoToMinuto(valorTemperatura: v)
            } else if d=="Grau" {
                return convertFromRadianoToGrau(valorTemperatura: v)
            }
        }
        return 0.0
    }
}