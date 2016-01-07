//
//  ViewControllerCG.swift
//  Unit Converter
//
//  Created by Carlos Filipe Pinto de Oliveira on 07/01/16.
//  Copyright © 2016 Carlos Filipe Pinto de Oliveira. All rights reserved.
//

import UIKit

class ViewControllerCG: UIViewController {

    
    @IBOutlet weak var latitude: UITextField!
    
    @IBOutlet weak var longitude: UITextField!
    
    @IBOutlet weak var horas: UITextField!
    @IBOutlet weak var minutos: UITextField!
    @IBOutlet weak var segundos: UITextField!
    
    @IBOutlet weak var horas2: UITextField!
    var TabConversoes : [Conversao] = []
    
    @IBOutlet weak var minutos2: UITextField!
    @IBOutlet weak var segundos2: UITextField!
    @IBAction func botaoUm(sender: UIButton) {
        let lat = Double(latitude.text!)
        let long = Double(longitude.text!)
        var flag = 0
        var erro = "Por favor inserir valores corretos"
        if (lat == nil || lat < 0 || lat > 90) {
            latitude.text = ""
            flag = 1
            erro = "Inserir valor entre 0 e 90"
        }
        if (long == nil  || long < 0 || long > 90) {
            longitude.text = ""
            flag = 1
            erro = "Inserir valor entre 0 e 90"
        }
        if (flag == 1) {
            let refreshAlert = UIAlertController(title: "Erro", message: erro, preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in return
            }))
            
            presentViewController(refreshAlert, animated: true, completion: nil)
            return
        }
        let (h1,m1,s1) = CoordenadaGeografica.convert(tempOrigem: "Graus Decimais", tempDestino: "Graus Geográficos", valor1: lat!, valor2: 0.0, valor3: 0.0)
        horas.text=String(Int(h1))
        minutos.text=String(Int(m1))
        segundos.text=String(Int(s1))
        let (h2,m2,s2) = CoordenadaGeografica.convert(tempOrigem: "Graus Decimais", tempDestino: "Graus Geográficos", valor1: long!, valor2: 0.0, valor3: 0.0)
        horas2.text=String(Int(h2))
        minutos2.text=String(Int(m2))
        segundos2.text=String(Int(s2))
        
        let conversao = Conversao(medida: "", origem: "", destino: "", valorOriginal: latitude.text! + " Lat " + longitude.text! + " Long", valorFinal: horas.text! + "º" + minutos.text! + "'" + segundos.text! + "\"")
        if (self.TabConversoes.count>=10) {
            self.TabConversoes.removeFirst()
        }
        self.TabConversoes.append(conversao)
        
        self.gravar()
    }
   
    @IBAction func botaoDois(sender: AnyObject) {
        let h = Double(horas2.text!)
        let m = Double(minutos2.text!)
        let s = Double(segundos2.text!)
        var flag = 0
        let erro = "Por favor inserir valores corretos"
        if (h == nil ) {
            horas.text = ""
            flag = 1
        }
        if (m == nil) {
            minutos.text = ""
            flag = 1
        }
        if (s == nil) {
            minutos.text = ""
            flag = 1
        }
        if (flag == 1) {
            let refreshAlert = UIAlertController(title: "Erro", message: erro, preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in return
            }))
            
            presentViewController(refreshAlert, animated: true, completion: nil)
            return
        }
        let (lat,_,_) = CoordenadaGeografica.convert(tempOrigem: "Graus Geográficos", tempDestino: "Graus Decimais", valor1: h!, valor2: m!, valor3: s!)
        latitude.text=String(lat)
        let (long,_,_) = CoordenadaGeografica.convert(tempOrigem: "Graus Geográficos", tempDestino: "Graus Decimais", valor1: h!, valor2: m!, valor3: s!)
        latitude.text=String(long)
        
        let conversao = Conversao(medida: "", origem: "", destino: "", valorOriginal: latitude.text! + " Lat " + longitude.text! + " Long", valorFinal: horas.text! + "º" + minutos.text! + "'" + segundos.text! + "\"")
        if (self.TabConversoes.count>=10) {
            self.TabConversoes.removeFirst()
        }
        self.TabConversoes.append(conversao)
        
        self.gravar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ler()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goHome(sender: UIBarButtonItem) {
        let presentingViewController :UIViewController! = self.presentingViewController;
        
        self.dismissViewControllerAnimated(false) {
            // go back to MainMenuView as the eyes of the user
            presentingViewController.dismissViewControllerAnimated(true, completion: nil)
        }
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
