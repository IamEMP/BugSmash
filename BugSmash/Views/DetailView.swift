//
//  DetailView.swift
//  BugSmash
//
//  Created by Ethan Phillips on 6/4/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var dataController: DataController
    
    
    var body: some View {
        VStack {
            if let issue = dataController.selectedIssue {
                IssueView(issue: issue)
            } else {
                NoIssueView()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
            .environmentObject(DataController.preview)
    }
}
