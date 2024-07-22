//
//  FilterView.swift
//  Search Example
//
//  Created by student on 22/07/24.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var viewModel : VehicalViewModel
    var body : some View {
        VStack(spacing : 25){
            HStack{
                Text("Filter")
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity,minHeight:0,maxHeight:100,
                           alignment:.leading)
                    .padding()
            }
            HStack(alignment:.center,spacing:15,content:{
                Button(action: {
                    viewModel.filterDataMedium(medium: .air)
                    viewModel.showFilter = false
                }, label: {
                    Text("Air")
                        .cornerRadius(20)
                })
                
                Button(action: {
                    viewModel.filterDataMedium(medium: .water)
                    viewModel.showFilter = false
                }, label: {
                    Text("Water")
                        .cornerRadius(20)
                })
                
                Button(action: {
                    viewModel.filterDataMedium(medium: .earth)
                    viewModel.showFilter = false
                }, label: {
                    Text("Earth")
                        .cornerRadius(20)
                })
                
            })
            
            HStack(alignment:.center,spacing:15,content:{
                Button(action: {
                    viewModel.filterDataWheels(wheels : 2)
                    viewModel.showFilter = false
                }, label: {
                    Text("2 Wheeler")
                        .cornerRadius(20)
                })
                
                Button(action: {
                    viewModel.filterDataWheels(wheels : 4)
                    viewModel.showFilter = false
                }, label: {
                    Text("4 Wheeler")
                        .cornerRadius(20)
                })
                
                Button(action: {
                    viewModel.filterDataWheels(wheels : 0)
                    viewModel.showFilter = false
                }, label: {
                    Text("Others")
                        .cornerRadius(20)
                })
                
            })
        }
    }
}
