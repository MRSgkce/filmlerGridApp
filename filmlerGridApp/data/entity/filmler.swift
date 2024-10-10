//
//  filmler.swift
//  filmlerGridApp
//
//  Created by Mürşide Gökçe on 8.10.2024.
//

import Foundation

class filmler  {
    var id: Int?
    var ad: String?
    var resim: String?
    var fiyat:Int?
    init(){
        
    }
    init(id: Int, ad: String, resim: String, fiyat:Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
    
    
    
}

