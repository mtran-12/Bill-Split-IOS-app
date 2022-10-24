//
//  MultipleSelectionRow.swift
//  Bill Splitter
//
//  Created by Matthew Tran on 10/18/22.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

//
//struct MultipleSelectionRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MultipleSelectionRow(title: "test", isSelected: false)
//    }
//}
