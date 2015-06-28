//
//  Model.swift
//  web-II
//
//  Created by Eduardo Santi on 27/06/15.
//  Copyright (c) 2015 Eduardo Santi. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    var id = 0
    var titulo = ""
    var conteudo = ""
    var nome = ""
    var comentarios = 0
    
    init(json: NSDictionary) {
        if let id = json["id"] as? Int {
            self.id = id
        }
        
        if let titulo = json["titulo"] as? String {
            self.titulo = titulo
        }
        
        if let conteudo = json["conteudo"] as? String {
            self.conteudo = conteudo
        }
        
        if let nome = json["nome"] as? String {
            self.nome = nome
        }
        
        if let comentarios = json["comentarios"] as? Int {
            self.comentarios = comentarios
        }
    }

}
