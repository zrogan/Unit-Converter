//
//  Peso.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 25/12/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import Foundation

class Peso {
    
    static func getList() -> Array<String> {
        return ["Grama","Onça","Quilograma"]
    }
    
    static func convertFromGramaToOnça(valorTemperatura v : Double) -> Double {
        return v * 0.035
    }
    
    static func convertFromGramaToQuilograma(valorTemperatura v: Double) -> Double {
        return v / 1000
    }
    
    static func convertFromOnçaToGrama(valorTemperatura v : Double) -> Double {
        return v * 28.375
    }
    
    static func convertFromQuilogramaToGrama(valorTemperatura v : Double) -> Double {
        return v * 1000
    }
    
    static func convertFromOnçaToQuilograma(valorTemperatura v : Double) -> Double {
        return v * 28.375 / 1000
    }
    
    static func convertFromQuilogramaToOnça(valorTemperatura v : Double) -> Double {
        return v / 1000 * 0.035
    }
    
    static func convert(tempOrigem o : String, tempDestino d : String, valor v:Double) ->Double{
        if o=="Quilograma" {
            if d=="Grama" {
                return convertFromQuilogramaToGrama(valorTemperatura: v)
            } else if d=="Onça" {
                return convertFromQuilogramaToOnça(valorTemperatura: v)
            }
        } else if o=="Grama" {
            if d=="Quilograma" {
                return convertFromGramaToQuilograma(valorTemperatura: v)
            } else if d=="Onça" {
                return convertFromGramaToOnça(valorTemperatura: v)
            }
        } else if o=="Onça" {
            if d=="Quilograma" {
                return convertFromOnçaToQuilograma(valorTemperatura: v)
            } else if d=="Grama" {
                return convertFromOnçaToGrama(valorTemperatura: v)
            }
        }
        return 0.0
    }
}