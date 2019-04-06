//
//  MovFavoriteCore.swift
//  Movs-Test
//
//  Created by Jose David Bustos H on 05-04-19.
//  Copyright © 2019 Jose David Bustos H. All rights reserved.
//
import CoreData
import Foundation
import UIKit
public class MovFavoriteCore{
    public func saveDataToCoreData(votecount: Int,
        id: Int,
        video: Bool,
        voteaverage: Double,
        title: String,
        popularity: Double,
        posterpath: String,
        originallanguage: String,
        originaltitle: String,
        //genreids: [Int],
        backdroppath: String,
        adult: Bool,
        overview: String,
        releasedate: String)-> Bool
    {
       
        var SavedItem:Bool = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MovFavorites", in: context)
        let newItem = NSManagedObject(entity: entity!, insertInto: context)
        newItem.setValue(votecount, forKey: "vote_count")
        newItem.setValue(id, forKey: "id")
        newItem.setValue(video, forKey: "video")
        newItem.setValue(voteaverage, forKey: "vote_average")
        newItem.setValue(title, forKey: "title")
        newItem.setValue(popularity, forKey: "popularity")
        newItem.setValue(posterpath, forKey: "poster_path")
        newItem.setValue(originallanguage, forKey: "original_language")
        newItem.setValue(originaltitle, forKey: "original_title")
        //newItem.setValue(genreids, forKey: "genre_ids")
        newItem.setValue(backdroppath, forKey: "backdrop_path")
        newItem.setValue(adult, forKey: "adult")
        newItem.setValue(overview, forKey: "overview")
        newItem.setValue(releasedate, forKey: "release_date")
        
        do {
            try context.save()
            SavedItem = true
            self.listUsersCoreData()
        } catch {
            SavedItem = false
            print("Failed saving")
        }
        return SavedItem
    }
    public func DeleteItemCoreData(id: Int)-> Bool
    {
        var DeletedItem:Bool = false
        
        return DeletedItem
    }
    
    func listUsersCoreData()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let contexts = appDelegate.persistentContainer.viewContext
         //let entitys = NSEntityDescription.entity(forEntityName: "MovFavorites", in: contexts)
         let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovFavorites")
         //request.predicate = NSPredicate(format: "age = %@", "12")
         request.returnsObjectsAsFaults = false
         
         do {
            let result = try contexts.fetch(request)
            for data in result as! [NSManagedObject] {
           // print(data.value(forKey: "id"))
            print(data.value(forKey: "title") as! String)
         }
         
         } catch {
                print("Failed")
         }
    }
}
