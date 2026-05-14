//
//  sampleTask.swift
//  Task Tracker
//
//  Created by Kushick Chakraborty on 15/5/26.
//

import SwiftUI

struct sampleTask: View {
    var body: some View {
        HStack(){
            
            Button {
                
            } label: {
                Image(systemName: "circle")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            Spacer()
            Text("Hello this one of the sample test task.how it is looking?")
                .font(.headline)
            Spacer()
            
        }
    }
}

#Preview {
    sampleTask()
}
