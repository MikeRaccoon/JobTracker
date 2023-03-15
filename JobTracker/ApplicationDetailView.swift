//
//  ApplicationDetailView.swift
//  JobTracker
//
//  Created by Mike on 2023-03-14.
//

import SwiftUI

struct ApplicationDetailView: View {
    var application: Job
    
    var body: some View {
        Text(application.date!.description)
    }
}

//struct ApplicationDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ApplicationDetailView(application: Job)
//    }
//}
