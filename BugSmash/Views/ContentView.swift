//
//  ContentView.swift
//  BugSmash
//
//  Created by Ethan Phillips on 5/8/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataController: DataController
    

    
    var body: some View {
        List(selection: $dataController.selectedIssue) {
            ForEach(dataController.issueForSelectedFilter()) { issue in
                IssueRowView(issue: issue)
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("Issues")
        .searchable(text: $dataController.filterText, tokens: $dataController.filterTokens, suggestedTokens: .constant(dataController.suggestedFilterTokens), prompt: "Filter issues, or type # to add tags") { tag in
            Text(tag.tagName)
        }
    }
    
    func delete(_ offsets: IndexSet) {
        let issues = dataController.issueForSelectedFilter()
        
        for offset in offsets {
            let item = issues[offset]
            dataController.delete(item)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataController.preview)
    }
}
