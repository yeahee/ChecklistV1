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
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(checklist.items){
                    index in RowView(checklistItem: self.$checklist.items[index])
                }// End of ForEach
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            }// End of List
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemViewIsVisible = true}){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                }
                ,trailing: EditButton())
                .navigationBarTitle("Checklist", displayMode: .inline)
            .onAppear(){
                self.checklist.printChecklistContents()
            }
        }// End of Navigation View
        .sheet(isPresented: $newChecklistItemViewIsVisible){
            NewChecklistItemView(checklist: self.checklist)
        }
    }// End of body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        checklistView()
    }
}
