//
//  ContentViewOverlay.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 26.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI

struct ContentViewOverlay: View {
    
    @EnvironmentObject var chartsViewModel: ChartsViewModel
    
    var body: some View {
        ScrollView {
            Button(action: {
                AppState.shared.toggleOverlay()
            }) {
                Text("Hide")
            }
            if chartsViewModel.pieChartViewModel.isLoaded && chartsViewModel.barChartViewModel.isLoaded {
                PieChartView(sliceBorderColor: .white).frame(height: 300)
                    .environmentObject(chartsViewModel.pieChartViewModel)
                BarChartView().frame(height: 300).environmentObject(chartsViewModel.barChartViewModel)
                LineChartView().frame(height: 300).environmentObject(chartsViewModel.lineChartViewModel)
            }
        }.padding([.top, .leading, .trailing], 10)
    }
    
}

struct ContentViewOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewOverlay()
    }
}
