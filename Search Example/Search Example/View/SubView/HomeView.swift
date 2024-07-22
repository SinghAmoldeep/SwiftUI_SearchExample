//
//  HomeView.swift
//  Search Example
//
//  Created by student on 22/07/24.
//

import SwiftUI

struct HomeView : View{
    @ObservedObject var viewModel:VehicalViewModel
    
    var body:some View{
        VStack{
            ScrollView{
                if viewModel.useSearch {
                    ForEach(viewModel.searchResults,id: \.self){item in
                        CardView(viewModel:viewModel,item:item)
                    }
                    
                } else {
                    ForEach(viewModel.filterDataList,id: \.self) { item in
                        CardView(viewModel:viewModel,item:item)
                    }
                }
            }
        }.frame(
            minWidth:0,
            maxWidth:.infinity,
            minHeight: 0,
            maxHeight:.infinity,
            alignment:.center
            )
        .background(Color.clear)
    }
}
#Preview {
    HomeView(viewModel: VehicalViewModel())

}
struct CardView : View {
    @ObservedObject var viewModel : VehicalViewModel
    var item = DataList(name:"",imageName: "",title:"",wheels:0,medium: .air)
    var body:some View {
        VStack{
            ZStack{
                Image(uiImage:UIImage(named:item.imageName ?? " ")!)
                    .resizable()
                    .frame(
                            minWidth:0,
                            maxWidth:.infinity,
                            minHeight: 0,
                            maxHeight:200,
                            alignment:.center
                )
                Text(item.title ?? " ")
                    .padding(.bottom,5)
            }.background(Color.green)
                .cornerRadius(20)
                .shadow(radius:10)
                .padding()
        }
    }
}
