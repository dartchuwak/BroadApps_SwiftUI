//
//  ResetView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import SwiftUI
import RealmSwift


struct ResetView: View {

    @Binding var isVisible: Bool
    var body: some View {
        VStack(spacing: 0) {

            Text("Reset Confirmation")
                .foregroundColor(.white)
                .font(.headline)
                .padding(.top, 20)
                .padding(.bottom, 2)
            Text("Your progress will be permanently reset. \nDo you really want to delete all data?")
                .font(.footnote)
                .padding(.bottom, 15)
                .lineLimit(2)
                .foregroundColor(.white)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
            Divider()
            Button(action: {
//                let config = Realm.Configuration(
//                    // Установи новую версию схемы. Она должна быть выше предыдущей версии (если это первая миграция, предыдущая версия была 0).
//                    schemaVersion: 2,
//
//                    // Блок миграции будет вызван автоматически при открытии Realm с новой схемой.
//                    migrationBlock: { migration, oldSchemaVersion in
//                        // Мы еще не выполняли миграцию, поэтому oldSchemaVersion == 0
//                        if (oldSchemaVersion < 2) {
//                            // Ничего не делаем, если добавление новых полей, Realm автоматически обработает это
//                            // Если есть необходимость в преобразовании данных, это делаем здесь
//                        }
//                    }
//                )
//
//                // Устанавливаем измененную конфигурацию по умолчанию для Realm
//                Realm.Configuration.defaultConfiguration = config

                // Теперь, при попытке открыть файл Realm, будет выполнена миграция, если это необходимо
                do {
                    let realm = try Realm()
                    try realm.write {
                        realm.deleteAll()
                    }
                } catch {
                    print("Ошибка при удалении всех объектов из Realm или при миграции: \(error)")
                }


            }, label: {
                Text("Reset")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.appTextSecondary))
            })
            .padding(.vertical, 11)
            Divider()
            Button(action: {
                isVisible.toggle()
            }, label: {
            Text("Cancel")
                    .font(.body)
                    .foregroundColor(Color(.appRed))
            })
            .padding(.vertical ,11)
        }
        .frame(width: 270, height: 183)
        .background(Color(.appGray))
        .cornerRadius(16)
    }
}

#Preview {
    ResetView(isVisible: .constant(true))
}
