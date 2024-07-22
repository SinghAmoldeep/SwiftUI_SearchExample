//
//  SearchView.swift
//  Search Example
//
//  Created by student on 22/07/24.
//

import SwiftUI

struct SearchView : View {
    
    @StateObject var viewModel : VehicalViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue:VehicalViewModel())
    }
    
    var body : some View {
        VStack {
            HomeView(viewModel:viewModel)
        }.toolbar {
            Button(action:{
                viewModel.showFilter.toggle()
            },label:{
                Image(systemName:"slider.horizontal.3")
            })
            
            Button(action : {
                viewModel.useSearch.toggle()
            }, label : {
                Image(systemName:"magnifyingglass.circle")
                    .opacity(viewModel.useSearch ? 1 : 0.5)
            })
        }
        .navigationTitle("Search Example")
        .searchable(text:$viewModel.searchText)
        .sheet(isPresented:$viewModel.showFilter) {
            FilterView(viewModel:viewModel)
                .presentationDetents([.medium,.large])
        }
    }
}

#Preview{
    SearchView()
}
