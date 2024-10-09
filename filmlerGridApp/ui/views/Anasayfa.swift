//
//  ViewController.swift
//  filmlerGridApp
//
//  Created by Mürşide Gökçe on 8.10.2024.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var filmlerListesi = [filmler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let f1 = filmler(id: 1, ad: "Django", resim: "django", fiyat: 24)
        let f2 = filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32)
        let f3 = filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16)
        let f4 = filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 28)
        let f5 = filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18)
        let f6 = filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 10)
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let ekrangenislik = UIScreen.main.bounds.width
        let itemgenislik = (ekrangenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemgenislik, height: itemgenislik*1.6)
        collectionView.collectionViewLayout = tasarim
        
        
        
    }


}

extension Anasayfa: UICollectionViewDataSource,UICollectionViewDelegate,HucreProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        hucre.imageViewControl.image = UIImage(named: film.resim!)
        hucre.labelFiyat.text = "\(film.fiyat!) TL"
        hucre.layer.borderColor = UIColor.black.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer .cornerRadius = 10.0
        
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        
        
    return hucre
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let film = sender as? filmler {
                let gidicelecevc = segue.destination as! DetaySayfa
                gidicelecevc.film = film
                
                
            }
        }
    }
    
    func sepetekleTiklandi(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print(film.ad)
        
    }
    
    
}

