//
//  ContentView.swift
//  SegmentedControl
//
//  Created by exey on 19.12.2019.
//  Copyright © 2019 exey. All rights reserved.
//

import SwiftUI
import GitHubAPIClient
import NewsAPIClient

final class ChartsViewModel: ObservableObject {
    
    @Published var pieChartViewModel = PieChartViewModel()
    @Published var barChartViewModel = BarChartViewModel()
    @Published var lineChartViewModel = LineChartViewModel(histogram: Histogram())
    
}

struct ContentView: View {
    
    @EnvironmentObject var chartsViewModel: ChartsViewModel
    
    @State private var selection = 0
    
    @State private var endpoints = ["Pie", "Bar", "Line"]
    

    var body: some View {
        VStack {
            Picker(selection: $selection, label: Text("3 source of charts")) {
                ForEach(0 ..< endpoints.count) { i in
                    Text(self.endpoints[i]).tag(i)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            if self.selection == 0 {
                PieChartView(sliceBorderColor: .white)
                    .environmentObject(chartsViewModel.pieChartViewModel)
            } else if self.selection == 1 {
                BarChartView().environmentObject(chartsViewModel.barChartViewModel)
            } else if self.selection == 2 {
                LineChartView().environmentObject(chartsViewModel.lineChartViewModel)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ChartsViewModel())
    }
}
