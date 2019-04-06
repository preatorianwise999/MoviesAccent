//
//  ViewController.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 03-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let array:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SaveData()
       self.myCollectionView.dataSource = self
       self.myCollectionView.delegate = self
        let itemSize = UIScreen.main.bounds.width/3 - 2
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        myCollectionView.collectionViewLayout = layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    //Movies view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCell
        cell.imageViewMov.image = UIImage(named: array[indexPath.row] + ".jpg")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    // Funciones
    func GoToLoadMovies()
    {
        
    }
    func GoToDetailMovie()
    {
        
    }
    func DeleteFavorite()
    {
        
    }
    func SaveData()
     {
       if ( MovFavoriteCore().saveDataToCoreData(
          votecount: 474,
          id: 329996,
          video: false,
          voteaverage: 6.8,
          title: "Dumbo",
          popularity: 257.98,
          posterpath: "/ttN0czDnCpr64aj3ANGEf3DKE1L.jpg",
          originallanguage: "en",
          originaltitle: "Dumbo",
         // genreids: [28,12,878],
          backdroppath: "/tz27bm8LAqK0SlX8TwXrtS9OiBB.jpg",
          adult: false,
          overview: "A young elephant, whose oversized ears enable him to fly, helps save a struggling circus, but when the circus plans a new venture, Dumbo and his friends discover dark secrets beneath its shiny veneer.",
          releasedate: "2019-03-27") == true )
       {
        
        }else{
        
        }
    }
    
}

