//
//  FilmlerHucre.swift
//  filmlerGridApp
//
//  Created by Mürşide Gökçe on 8.10.2024.
//

import UIKit

protocol HucreProtocol {
    func sepetekleTiklandi(indexPath: IndexPath)
}
class FilmlerHucre: UICollectionViewCell {
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageViewControl: UIImageView!
    var hucreProtocol: HucreProtocol?
    var indexPath: IndexPath?
    @IBAction func butonSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepetekleTiklandi(indexPath: indexPath!)
    }
}
