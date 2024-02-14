//
//  TextFieldView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct StatusView: View {

    @Binding var status: Status
    private let placeholder: String = "Status"
    @State private var showActionSheet: Bool = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1.0)
                .frame(height: 62)
                .foregroundColor(.gray)


                Menu {
                    Picker("", selection: $status) {
                        Text(Status.archived.rawValue).tag(Status.archived)
                        Text(Status.published.rawValue).tag(Status.published)
                        Text(Status.sent.rawValue).tag(Status.sent)
                        Text(Status.writing.rawValue).tag(Status.writing)
                    }
                } label: {
                    HStack {
                        Text((status == .none ? "Status" : status.rawValue))
                            .frame(height: 55)
                            .accentColor(status == .none ? .gray : .white)
                        Image(systemName: "chevron.down")
                            .accentColor(status == .none ? .gray : .white)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
        }
    }

    func actionSheet() -> ActionSheet {
        ActionSheet(title: Text("Choose status"), buttons: Status.allCases.map { item in
                .default(Text(item.rawValue)) {
                    status = item
                }
        })
    }

}

enum Status: String, CaseIterable, Identifiable {
    case writing = "Writing"
    case sent = "Sent"
    case published = "Published"
    case archived = "Archived"
    case none = "none"
    var id: Self { self }
}

#Preview {
    StatusView(status: .constant(.none))
}
