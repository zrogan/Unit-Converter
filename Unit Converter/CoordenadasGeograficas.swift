//
//  CoordenadasGeograficas.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 25/12/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import Foundation

class CoordenadaGeografica {
    
    static func getList() -> Array<String> {
        return ["Quarto","Galao","Litro"]
    }
    
    static func convertFromQuartoToGalao(valorTemperatura v : Double) -> Double {
        return v / 4
    }
    
    static func convertFromQuartoToLitro(valorTemperatura v: Double) -> Double {
        return v * 0.9463
    }
    
    static func convertFromGalaoToQuarto(valorTemperatura v : Double) -> Double {
        return v * 4
    }
    
    static func convertFromLitroToQuarto(valorTemperatura v : Double) -> Double {
        return v * 1.057
    }
    
    static func convertFromGalaoToLitro(valorTemperatura v : Double) -> Double {
        return v * 3.785
    }
    
    static func convertFromLitroToGalao(valorTemperatura v : Double) -> Double {
        return v * 0.264
    }
    
    static func convert(tempOrigem o : String, tempDestino d : String, valor v:Double) ->Double{
        if o=="Litro" {
            if d=="Quarto" {
                return convertFromLitroToQuarto(valorTemperatura: v)
            } else if d=="Galao" {
                return convertFromLitroToGalao(valorTemperatura: v)
            }
        } else if o=="Quarto" {
            if d=="Litro" {
                return convertFromQuartoToLitro(valorTemperatura: v)
            } else if d=="Galao" {
                return convertFromQuartoToGalao(valorTemperatura: v)
            }
        } else if o=="Galao" {
            if d=="Litro" {
                return convertFromGalaoToLitro(valorTemperatura: v)
            } else if d=="Quarto" {
                return convertFromGalaoToQuarto(valorTemperatura: v)
            }
        }
        return 0.0
    }
}