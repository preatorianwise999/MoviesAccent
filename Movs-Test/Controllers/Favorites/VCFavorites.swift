//
//  VCFavorites.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 04-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class VCFavorites: UIViewController,UITableViewDataSource ,UITableViewDelegate {
    let pathWebpicture = "http://image.tmdb.org/t/p/w500"
    @IBOutlet weak var tableView: UITableView!
    private var favoritos = [itemsCore]()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
        print(" favoritos " + String(favoritos.count))
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func updateData() {
        favoritos = CoreDataManager.fetchObj()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else { return UITableViewCell() }
        
        cell.textTitle.text = favoritos[indexPath.row].title
        cell.textDescp.text =   favoritos[indexPath.row].overview
        cell.textDate.text =  favoritos[indexPath.row].releasedate
        
        let paths = String(self.pathWebpicture) + favoritos[indexPath.row].posterpath!
        if let imageURL = URL(string:paths) {
            print(imageURL)
            
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                   
                        cell.imageViewCell.image = image
                    
                }
            
        }
        
        return cell
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
    @IBAction func BtnRemover(_ sender: Any) {
        
    }
    
   func GoToRemover()
   {
    
        updateData()
   }
    
}
