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
    
    @IBAction func goHome(sender: UIBarButtonItem) {
        self.navigationController!.popToRootViewControllerAnimated(true)
    }
    @IBOutlet weak var labelOrigem: UILabel!
    @IBOutlet weak var textValor: UITextField!
    @IBOutlet weak var labelDestino: UILabel!
    @IBOutlet weak var labelResultado: UILabel!
    
    @IBAction func buttonCalcula(sender: AnyObject) {
        let valorOrigem = Double(self.textValor.text!)
        print(valorOrigem)
        if (valorOrigem == nil) {
            self.textValor.text = ""
            let refreshAlert = UIAlertController(title: "Erro", message: "Por favor inserir valor correcto.", preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in return
            }))
            
            presentViewController(refreshAlert, animated: true, completion: nil)
            return
        }
        if self.medida == "Temperatura" {
            self.labelResultado.text = String(Temperatura.convert(tempOrigem: self.origem!, tempDestino: self.destino!, valor: Double(self.textValor.text!)!))
        } else if self.medida == "Distância" {
            self.labelResultado.text = String(Comprimento.convert(tempOrigem: self.origem!, tempDestino: self.destino!, valor: Double(self.textValor.text!)!))
        } else if self.medida == "Área" {
            self.labelResultado.text = String(Area.convert(tempOrigem: self.origem!, tempDestino: self.destino!, valor: Double(self.textValor.text!)!))
        } else if self.medida == "Peso" {
            self.labelResultado.text = String(Peso.convert(tempOrigem: self.origem!, tempDestino: self.destino!, valor: Double(self.textValor.text!)!))
        } else if self.medida == "Volume" {
            self.labelResultado.text = String(Volume.convert(tempOrigem: self.origem!, tempDestino: self.destino!, valor: Double(self.textValor.text!)!))
        } else if self.medida == "Ângulos" {
            self.labelResultado.text = String(Angulo.convert(tempOrigem: self.origem!, tempDestino: self.destino!, valor: Double(self.textValor.text!)!))
        } else if self.medida == "Coordenadas Geográficas" {
            self.labelResultado.text = String(CoordenadaGeografica.convert(tempOrigem: self.origem!, tempDestino: self.destino!, valor1: Double(self.textValor.text!)!,valor2: 0.0,valor3: 0.0))
        }
        let conversao = Conversao(medida: self.medida!, origem: self.origem!, destino: self.destino!, valorOriginal: self.textValor.text!, valorFinal: self.labelResultado.text!)
        if (self.TabConversoes.count>=10) {
            self.TabConversoes.removeFirst()
        }
        self.TabConversoes.append(conversao)
        
        self.gravar()
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
