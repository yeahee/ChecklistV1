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
                ForEach(checklistItems, id: \.self){
                    item in Text(item)
                }// End of ForEach
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            }// End of List
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.printChecklistContents()
            }
        }// End of Navigation View
    }// End of body
    
    // Method
    func printChecklistContents(){
        for item in checklistItems{
            print(item)
        }
    }
    func deleteListItem(whichElement: IndexSet){
        checklistItems.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    func moveListItem(whichElement: IndexSet, destination: Int){
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
