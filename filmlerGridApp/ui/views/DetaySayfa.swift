//
//  DetaySayfa.swift
//  filmlerGridApp
//
//  Created by Mürşide Gökçe on 8.10.2024.
//
import UIKit
class DetaySayfa: UIViewController {
    
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var labelFilm: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    var film : filmler?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film {
            
            labelFilm.text = f.ad
            imageview.image = UIImage(named: f.resim!)
            labelFiyat.text = "\(f.fiyat!) TL"
            
        }
        
        
    }
}
