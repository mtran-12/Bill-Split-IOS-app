//
//  SplitDiffItems.swift
//  Bill Splitter
//
//  Created by Matthew Tran on 10/16/22.
//

import SwiftUI

struct SplitDiffItems: View {
    @State private var people = []
    @State private var checkAmount = 0.0
    @State private var numberOfPeopleSelection = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeopleSelection + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Amount: ")
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.identifier))
                            .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    }
                }
                
                Section {
                    // Should probably make this better later, but select no tip if this
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    .disabled(true)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.identifier))
                } header: {
                    Text("Total Per Person")
                }
            }
            .navigationTitle("Bill Splitter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
        }
        }
    }
}

struct SplitDiffItems_Previews: PreviewProvider {
    static var previews: some View {
        SplitDiffItems()
    }
}
