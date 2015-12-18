//
//  Comprimento.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 18/12/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import Foundation

class Comprimento {
    
    static func getList() -> Array<String> {
        return ["Quilómetros","Metros","Milímetros"]
    }
    
    static func convertFromKMToM(valorTemperatura v : Double) -> Double {
        return v * 1000
    }
    
    static func convertFromKMToMM(valorTemperatura v: Double) -> Double {
        return v * 1000000
    }
    
    static func convertFromMToKM(valorTemperatura v : Double) -> Double {
        return v / 1000
    }
    
    static func convertFromMMToKM(valorTemperatura v : Double) -> Double {
        return v / 1000000
    }
    
    static func convertFromMToMM(valorTemperatura v : Double) -> Double {
        return v * 1000
    }
    
    static func convertFromMMToM(valorTemperatura v : Double) -> Double {
        return v / 10000
    }
    
    static func convert(tempOrigem o : String, tempDestino d : String, valor v:Double) ->Double{
        if o=="Milímetros" {
            if d=="Quilómetros" {
                return convertFromMMToKM(valorTemperatura: v)
            } else if d=="Metros" {
                return convertFromMMToM(valorTemperatura: v)
            }
        } else if o=="Quilómetros" {
            if d=="Milímetros" {
                return convertFromKMToMM(valorTemperatura: v)
            } else if d=="Metros" {
                return convertFromKMToM(valorTemperatura: v)
            }
        } else if o=="Metros" {
            if d=="Milímetros" {
                return convertFromMToMM(valorTemperatura: v)
            } else if d=="Quilómetros" {
                return convertFromMToKM(valorTemperatura: v)
            }
        }
        return 0.0
    }
}