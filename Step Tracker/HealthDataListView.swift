//
//  HealthDataListView.swift
//  Step Tracker
//
//  Created by Guilherme Golfetto on 17/06/24.
//

import SwiftUI

struct HealthDataListView: View {
    
    var metric: HealthMetricContext
    
    @State private var isShowingAddData = false
    @State private var addDataDate: Date = .now
    @State private var valueToAdd: String = ""
    
    var body: some View {
        List(0..<28) { i in
            HStack {
                Text(Date(), format: .dateTime.day().month().year())
                
                Spacer()
                
                Text(10000, format: .number.precision(.fractionLength(metric == .steps ? 0 : 1)))
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isShowingAddData) {
            addDataView
        }
        .toolbar {
            Button("Add Data", systemImage: "plus") {
                isShowingAddData = true
            }
        }
    }
    
    var addDataView: some View {
        NavigationStack {
            
            Form {
                DatePicker("Date", selection: $addDataDate, displayedComponents: .date)
                
                HStack {
                    
                    Text(metric.title)
                    
                    Spacer()
                    
                    TextField("Value", text: $valueToAdd)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 140)
                        .keyboardType(metric == .steps ? .numberPad : .decimalPad)
                }
                
            }
            .navigationTitle(metric.title)
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss") {
                        isShowingAddData = false
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Data") {
                        //volto aqui depois
                    }
                }
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDataListView(metric: .steps)
    }
}
