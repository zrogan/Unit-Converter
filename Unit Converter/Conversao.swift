//
//  Conversao.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 25/12/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import Foundation

class Conversao : NSObject, NSCoding {
    var medida : String?
    var origem : String?
    var destino : String?
    var valorOriginal : String?
    var valorFinal : String?
    
    init(medida: String, origem: String, destino: String, valorOriginal: String, valorFinal: String) {
        self.medida = medida
        self.origem = origem
        self.destino = destino
        self.valorOriginal = valorOriginal
        self.valorFinal = valorFinal
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(medida, forKey: "medida")
        aCoder.encodeObject(origem, forKey: "origem")
        aCoder.encodeObject(destino, forKey: "destino")
        aCoder.encodeObject(valorOriginal, forKey: "valorOriginal")
        aCoder.encodeObject(valorFinal, forKey: "valorFinal")
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let medida = aDecoder.decodeObjectForKey("medida") as! String
        let origem = aDecoder.decodeObjectForKey("origem") as! String
        let destino = aDecoder.decodeObjectForKey("destino") as! String
        let valorOriginal = aDecoder.decodeObjectForKey("valorOriginal") as! String
        let valorFinal = aDecoder.decodeObjectForKey("valorFinal") as! String
        
        // Must call designated initializer.
        self.init(medida: medida, origem: origem, destino: destino, valorOriginal: valorOriginal, valorFinal: valorFinal)
    }
}
