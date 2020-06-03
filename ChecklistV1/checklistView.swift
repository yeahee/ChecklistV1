//
//  ContentView.swift
//  ChecklistV1
//
//  Created by Release on 2020/05/27.
//  Copyright © 2020 yehee. All rights reserved.
//

import SwiftUI

struct checklistView: View {
    
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(checklist.checklistItems){
                    checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "☑️" : "⬛️")
                    }// End of HStack
                    .background(Color.white)
                    .onTapGesture {
                        if let matchingIndex = self.checklist.checklistItems.firstIndex(where: {$0.id == checklistItem.id}){
                            self.checklist.checklistItems[matchingIndex].isChecked.toggle()}
                        self.checklist.printChecklistContents()
                    }
                }// End of ForEach
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }// End of List
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.checklist.printChecklistContents()
            }
        }// End of Navigation View
    }// End of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        checklistView()
    }
}
