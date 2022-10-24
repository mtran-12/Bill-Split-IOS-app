//
//  MultipleSelectionList.swift
//  Bill Splitter
//
//  Created by Matthew Tran on 10/18/22.
//

import SwiftUI

struct MultipleSelectionList: View {
    @Binding var allItems: [String]
    @Binding var selections: Set<String>

    var body: some View {
        List {
            ForEach(self.allItems, id: \.self) { item in
                MultipleSelectionRow(title: item, isSelected: self.selections.contains(item)) {
                    if self.selections.contains(item) {
                        self.selections.remove(item)
                    }
                    else {
                        self.selections.insert(item)
                    }
                }
            }
        }
    }
}

// Since we have a binding, in order to test this view easier, this is needed so that the
// data will actually update
struct MultipleSelectionsList_ContentView: View {
    @State private var testItems = ["test1", "test2", "test3"]
    @State private var testSelections: Set = ["test1"]
    
    var body: some View {
        MultipleSelectionList(allItems: $testItems, selections:$testSelections)
    }
}

struct MultipleSelectionList_Previews: PreviewProvider {
    
    static var previews: some View {
        MultipleSelectionsList_ContentView()
    }
}
