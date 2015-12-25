//
//  Volume.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 25/12/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import Foundation

class Volume {
    
    static func getList() -> Array<String> {
        return ["Quarto","Galão","Litro"]
    }
    
    static func convertFromQuartoToGalão(valorTemperatura v : Double) -> Double {
        return v / 4
    }
    
    static func convertFromQuartoToLitro(valorTemperatura v: Double) -> Double {
        return v * 0.9463
    }
    
    static func convertFromGalãoToQuarto(valorTemperatura v : Double) -> Double {
        return v * 4
    }
    
    static func convertFromLitroToQuarto(valorTemperatura v : Double) -> Double {
        return v * 1.057
    }
    
    static func convertFromGalãoToLitro(valorTemperatura v : Double) -> Double {
        return v * 3.785
    }
    
    static func convertFromLitroToGalão(valorTemperatura v : Double) -> Double {
        return v * 0.264
    }
    
    static func convert(tempOrigem o : String, tempDestino d : String, valor v:Double) ->Double{
        if o=="Litro" {
            if d=="Quarto" {
                return convertFromLitroToQuarto(valorTemperatura: v)
            } else if d=="Galão" {
                return convertFromLitroToGalão(valorTemperatura: v)
            }
        } else if o=="Quarto" {
            if d=="Litro" {
                return convertFromQuartoToLitro(valorTemperatura: v)
            } else if d=="Galão" {
                return convertFromQuartoToGalão(valorTemperatura: v)
            }
        } else if o=="Galão" {
            if d=="Litro" {
                return convertFromGalãoToLitro(valorTemperatura: v)
            } else if d=="Quarto" {
                return convertFromGalãoToQuarto(valorTemperatura: v)
            }
        }
        return 0.0
    }
}