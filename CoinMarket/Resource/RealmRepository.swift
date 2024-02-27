//
//  RealmRepository.swift
//  CoinMarket
//
//  Created by JinwooLee on 2/27/24.
//

import Foundation
import RealmSwift

final class RealmRepository {
    
    private let realm = try! Realm()
    
    func realmLocation() {
        print(realm.configuration.fileURL!)
    }
    
    
    // CREATE
    func createItem<T:Object>(_ item : T) {
        
        do {
            try realm.write {
                realm.add(item)
                print("Realm Create")
            }
        } catch {
            print(error)
        }
    }
    
    // CREATE OR UPDATE
    func searchCreateOrUpdateItem(coinID : String, coinName : String,
                                  conSymbol : String, rank : Int?,
                                  thumb : String) {
        do {
            try realm.write {
                realm.create(Search.self,
                             value: ["coinID": coinID,
                                     "coinName":coinName,
                                     "conSymbol": conSymbol,
                                     "rank" : rank,
                                     "thumb": thumb,
                                     "upDate":Date()
                                    ],
                             update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
    
    
    // FAVORITE TOGGLE
    func updateFavoriteToggle(_ item : Search) {
        
        do {
            try realm.write {
                item.favorite.toggle()
            }
        } catch {
            print(error)
        }
    }
    
    
    
    
}
