//
//  ViewModel.swift
//  Search Example
//
//  Created by student on 22/07/24.
//

import Foundation

enum medium{
    case earth
    case air
    case water
}

class VehicalViewModel : ObservableObject{
    @Published var searchText = ""
    @Published var showFilter = false
    @Published var useSearch = true
    var dataList : [DataList] = [
        DataList(name: "Car", imageName: "Car", title: "This is a car ", wheels: 4, medium: .earth),
        DataList(name: "Bike", imageName: "Bike", title: "This is a bike ", wheels: 2, medium: .earth),
        DataList(name: "Cycle", imageName: "Cycle", title: "This is a cycle ", wheels: 2, medium: .earth),
        DataList(name: "Plane", imageName: "Plane", title: "This is a plane ", wheels: 0, medium: .air),
        DataList(name: "Train", imageName: "Train", title: "This is a train ", wheels: 0, medium: .earth),
        DataList(name: "Submarine", imageName: "Submarine", title: "This is a submarine ", wheels: 0, medium: .water)
    ]
    @Published var filterDataList:[DataList] = []
    
    var searchResults : [DataList] {
        if searchText.isEmpty{
            return dataList
        } else {
            return dataList.filter{
                $0.name?.contains(searchText) ?? false ||
                $0.title?.contains(searchText) ?? false
            }
        }
    }
    
    func filterDataMedium(medium : medium){
        filterDataList = dataList.filter { $0.medium == medium}
    }
    
    func filterDataWheels(wheels : Int){
        filterDataList = dataList.filter { $0.wheels  == wheels}
    }

}
