//
//  ViewController.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 11/11/15.
//  Copyright © 2015 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var medida : String?
    var medidas : Array<String>?
    var origem : String?
    var destino : String?
    var TabConversoes : [Conversao] = []
    
    @IBOutlet weak var labelOrigem: UILabel!
    @IBOutlet weak var textValor: UITextField!
    @IBOutlet weak var labelDestino: UILabel!
    @IBOutlet weak var labelResultado: UILabel!
    
    @IBAction func buttonCalcula(sender: AnyObject) {
        if medida == "Temperatura" {
            labelResultado.text = String(Temperatura.convert(tempOrigem: origem!, tempDestino: destino!, valor: Double(textValor.text!)!))
        } else if medida == "Distância" {
            labelResultado.text = String(Comprimento.convert(tempOrigem: origem!, tempDestino: destino!, valor: Double(textValor.text!)!))
        } else if medida == "Área" {
            labelResultado.text = String(Area.convert(tempOrigem: origem!, tempDestino: destino!, valor: Double(textValor.text!)!))
        } else if medida == "Peso" {
            labelResultado.text = String(Peso.convert(tempOrigem: origem!, tempDestino: destino!, valor: Double(textValor.text!)!))
        } else if medida == "Volume" {
            labelResultado.text = String(Volume.convert(tempOrigem: origem!, tempDestino: destino!, valor: Double(textValor.text!)!))
        } else if medida == "Ângulos" {
            labelResultado.text = String(Angulo.convert(tempOrigem: origem!, tempDestino: destino!, valor: Double(textValor.text!)!))
        } else if medida == "Coordenadas Geográficas" {
            labelResultado.text = String(CoordenadaGeografica.convert(tempOrigem: origem!, tempDestino: destino!, valor: Double(textValor.text!)!))
        }
        let conversao = Conversao(medida: medida!, origem: origem!, destino: destino!, valorOriginal: textValor.text!, valorFinal: labelResultado.text!)
        if (TabConversoes.count>=10) {
            TabConversoes.removeFirst()
        }
        TabConversoes.append(conversao)
        
        gravar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelOrigem.text = origem
        labelDestino.text = destino
        labelResultado.text = ""
        ler()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gravar() {
        let documents = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        
        let writePath = documents.URLByAppendingPathComponent("file.dat").path!
        
        NSKeyedArchiver.archiveRootObject(TabConversoes, toFile: writePath)
    }
    
    func ler() {
        let documents = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
        
        let readPath = documents.URLByAppendingPathComponent("file.dat").path!
        
        let tab = NSKeyedUnarchiver.unarchiveObjectWithFile(readPath)
        
        if tab != nil {
            TabConversoes = tab as! [Conversao]
        } else {
            TabConversoes = []
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
