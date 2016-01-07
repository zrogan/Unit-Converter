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
        return ["Graus Decimais","Graus Geográficos"]
    }
    
    static func convertFromGrausDToGrausG(valor l : Double) -> (Double,Double,Double) {
        let h = Double(Int(l))
        let m = (l-h)*60
        let s = (Double(Int(m))-m)*60
        return(h,m,s)
        
    }
    
    static func convertFromGrausGToGrausD(horas h: Double, minutos m: Double, segundos s: Double) -> Double {
        return h + m/60 + s/3600
    }
    
    
    static func convert(tempOrigem o : String, tempDestino d : String, valor1 v1:Double, valor2 v2:Double,valor3 v3: Double) ->(Double,Double,Double){
        if o=="Graus Decimais" {
            return convertFromGrausDToGrausG(valor: v1)
        } else if o=="Graus Geográficos" {
            return (convertFromGrausGToGrausD(horas : v1,minutos : v2,segundos: v3),0,0)
        }
        return (0.0,0.0,0.0)
    }
}