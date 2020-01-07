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
    
}

//struct ButtonPressStyle: ButtonStyle {
//
//  func makeBody(configuration: Self.Configuration) -> some View {
//    configuration.label
//      .padding()
//      .foregroundColor(.white)
//      .background(configuration.isPressed ? Color.black : Color.gray)
//      .cornerRadius(10.0)
//      .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
//  }
//
//}
//
//struct PieView: View {
//
//    @State private var showChart = false
//
//    var body: some View {
//        VStack(spacing: 10) {
//
//            Button(action: {
//                withAnimation {
//                    self.showChart.toggle()
//                }
//            }) {
//              Text("Custom Button")
//            }
//
//            .buttonStyle(ButtonPressStyle())
//
//            if showChart {
//                Text("Pie Chart")
//                .transition(.move(edge: .bottom))
//            }
//        }
//        .padding(.top, 10)
//    }
//
//}

//final class ChartsViewModel: ObservableObject {
//
//    @Published var news: ArticleList?
//
//}

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
//                PieChartView(data: [57567, 2169, 4320], backgroundColor: .white)
                PieChartView(sliceBorderColor: .white)
                    .environmentObject(chartsViewModel.pieChartViewModel)
            } else if self.selection == 1 {
                BarChartRow(data: [8,23,54,32,12,37,7], accentColor: Colors.OrangeStart, touchLocation: .constant(-1))
//                Text("Bar").transition(.scale)
            } else if self.selection == 2 {
                Text("Line")
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
