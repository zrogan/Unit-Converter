//
//  Área.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 19/12/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import Foundation

class Area {
    
    static func getList() -> Array<String> {
        return ["Metros Quadrados","Hectares","Acres"]
    }
    
    static func convertFromMetrosQuadradosToHectares(valorTemperatura v : Double) -> Double {
        return v / 10
    }
    
    static func convertFromMetrosQuadradosToAcres(valorTemperatura v: Double) -> Double {
        return v / 4.047
    }
    
    static func convertFromHectaresToMetrosQuadrados(valorTemperatura v : Double) -> Double {
        return v * 10
    }
    
    static func convertFromAcresToMetrosQuadrados(valorTemperatura v : Double) -> Double {
        return v * 4.047
    }
    
    static func convertFromHectaresToAcres(valorTemperatura v : Double) -> Double {
        return v / 0.4047
    }
    
    static func convertFromAcresToHectares(valorTemperatura v : Double) -> Double {
        return v * 0.4047
    }
    
    static func convert(tempOrigem o : String, tempDestino d : String, valor v:Double) ->Double{
        if o=="Acres" {
            if d=="Metros Quadrados" {
                return convertFromAcresToMetrosQuadrados(valorTemperatura: v)
            } else if d=="Hectares" {
                return convertFromAcresToHectares(valorTemperatura: v)
            }
        } else if o=="Metros Quadrados" {
            if d=="Acres" {
                return convertFromMetrosQuadradosToAcres(valorTemperatura: v)
            } else if d=="Hectares" {
                return convertFromMetrosQuadradosToHectares(valorTemperatura: v)
            }
        } else if o=="Hectares" {
            if d=="Acres" {
                return convertFromHectaresToAcres(valorTemperatura: v)
            } else if d=="Metros Quadrados" {
                return convertFromHectaresToMetrosQuadrados(valorTemperatura: v)
            }
        }
        return 0.0
    }
}