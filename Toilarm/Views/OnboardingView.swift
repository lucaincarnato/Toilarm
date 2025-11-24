//
//  OnboardingView.swift
//  Toilarm
//
//  Created by Luca Maria Incarnato on 20/11/25.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    @Environment(\.modelContext) private var modelContext
    @AppStorage("Onboarding") var onboarding: Bool = true

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 40)
            Text("Welcome to\nToilarm")
                .font(.system(size: 38, weight: .heavy))
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 30) {
                FeatureRow(
                    iconName: "alarm.fill",
                    title: "Found Events",
                    description: "Have full control over your sleep schedule, customize your alarms and never be late again!"
                )
                
                FeatureRow(
                    iconName: "toilet.fill",
                    title: "Your body your schedule",
                    description: "Your body is the perfect alarm you can ever desire, Toilarm is just a little helper."
                )
                
                FeatureRow(
                    iconName: "camera.fill",
                    title: "Shoot it then stop it",
                    description: "Wake up, go to the bathroom, take a photo of your toilet and stop the alarm! Your body will thank you."
                )
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button() {
                onboarding = false
                let alarm = TAlarm()
                alarm.created = Date.now.addingTimeInterval(-500)
                modelContext.insert(alarm)
            } label: {
                Text("Continue")
                    .font(.title3)
                    .bold()
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.glassProminent)
            .padding(.horizontal, 40)
            .padding(.bottom, 50)
        }
    }
}

struct FeatureRow: View {
    var iconName: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(systemName: iconName)
                .font(.system(size: 36))
                .foregroundColor(Color.accent)
                .frame(width: 40, alignment: .center)
                .padding(.top, 2)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(description)
                    .font(.callout)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
