//
//  DetailViewController.swift
//  web-II
//
//  Created by Eduardo Santi on 27/06/15.
//  Copyright (c) 2015 Eduardo Santi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblPost: UILabel!
    @IBOutlet weak var lblAutor: UILabel!
    @IBOutlet weak var lblNumComentarios: UILabel!
    @IBOutlet weak var txtConteudo: UITextView!
    
    var model: Model!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblPost.text = self.model.titulo
        self.lblAutor.text = self.model.nome
        self.lblNumComentarios.text = String(self.model.comentarios)
        self.txtConteudo.text = self.model.conteudo
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnVoltar(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
