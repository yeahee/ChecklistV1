//
//  ContentView.swift
//  ChecklistV1
//
//  Created by Release on 2020/05/27.
//  Copyright © 2020 yehee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = ["Walk the dog", "Brush my teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"]
    var body: some View {
        NavigationView{
            List{
                Text(checklistItems[0]).onTapGesture {
                    self.checklistItems[0] = "Take the dog to the vet"
                }
                Text(checklistItems[1])
                Text(checklistItems[2])
                Text(checklistItems[3])
                Text(checklistItems[4])
            }// End of List
            .navigationBarTitle("Checklist")
        }// End of Navigation View
    }// End of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
