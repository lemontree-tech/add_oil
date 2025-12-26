# Apple App Store Deployment Guide

## ✅ Completed Steps

1. ✅ **Bundle Identifier Updated**: Changed to `com.lt.addoil`
2. ✅ **App Description Updated**: Updated in `pubspec.yaml`
3. ✅ **Privacy Policy Template Created**: See `PRIVACY_POLICY.md`

## 📋 Pre-Submission Checklist

### 1. App Store Connect Setup

#### Create App Listing
1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Click **My Apps** → **+** → **New App**
3. Fill in:
   - **Platform**: iOS
   - **Name**: 加油 (or "Add Oil")
   - **Primary Language**: Chinese (Traditional) or English
   - **Bundle ID**: `com.lt.addoil` (must match exactly)
   - **SKU**: Unique identifier (e.g., `addoil-ios-001`)
   - **User Access**: Full Access (or Limited if using team)

#### App Information
- **Privacy Policy URL**: [Your hosted privacy policy URL]
  - ⚠️ **REQUIRED**: You must host `PRIVACY_POLICY.md` on a public website
  - Example: `https://yourwebsite.com/privacy-policy`
- **Category**: 
  - Primary: Lifestyle or Books
  - Secondary: (optional)
- **Content Rights**: If using copyrighted quotes, ensure you have rights
- **Age Rating**: Complete the questionnaire (likely 4+ or 9+)

### 2. Build & Archive

#### Prerequisites
- [ ] Xcode installed (latest version recommended)
- [ ] Apple Developer account active ($99/year)
- [ ] Bundle ID `com.lt.addoil` registered in your Apple Developer account
- [ ] Provisioning profiles set up (Xcode can do this automatically)

#### Build Steps

1. **Clean and get dependencies**:
```bash
cd client
flutter clean
flutter pub get
```

2. **Generate app icons** (if not done):
```bash
flutter pub run flutter_launcher_icons
```

3. **Build iOS release**:
```bash
flutter build ios --release
```

4. **Open in Xcode**:
```bash
open ios/Runner.xcworkspace
```

5. **In Xcode**:
   - Select **Runner** in project navigator
   - Select **Runner** target
   - Go to **Signing & Capabilities**
   - Ensure **Automatically manage signing** is checked
   - Select your **Team** (Apple Developer account)
   - Verify Bundle Identifier is `com.lt.addoil`
   - Xcode will automatically create provisioning profiles

6. **Archive**:
   - Select **Any iOS Device** (or a connected device) in scheme selector
   - Go to **Product** → **Archive**
   - Wait for archive to complete

7. **Upload to App Store**:
   - In Organizer window, select your archive
   - Click **Distribute App**
   - Choose **App Store Connect**
   - Follow the wizard:
     - Distribution: **App Store Connect**
     - Distribution options: **Upload** (not export)
     - App Thinning: **All compatible device variants**
     - Re-sign if needed: Let Xcode handle it
   - Click **Upload**

### 3. App Store Listing Requirements

#### Screenshots (REQUIRED)
You need screenshots for these device sizes:
- **6.7" Display** (iPhone 14 Pro Max, 15 Pro Max): 1290 x 2796 pixels
- **6.5" Display** (iPhone 11 Pro Max, XS Max): 1242 x 2688 pixels  
- **5.5" Display** (iPhone 8 Plus): 1242 x 2208 pixels

**How to capture**:
1. Run app on simulator or device
2. Take screenshots (Cmd+S in simulator)
3. Or use Xcode → Debug → View Debugging → Capture View Hierarchy

**Tips**:
- Show the main quote display
- Include the countdown timer
- Make it visually appealing
- Can use same screenshot for all sizes (App Store will scale)

#### App Preview Video (Optional but Recommended)
- 15-30 seconds
- Show app in action
- Can be same video for all sizes

#### App Description

**Short Description** (up to 170 characters):
```
每日智慧 - 基於設備和日期的中文古典文學每日名言應用。每天為您呈現一句精心挑選的古典文學名言。
```

**Long Description** (up to 4000 characters):
```
每日智慧 (加油) 是一款精美的中文古典文學每日名言應用。

✨ 主要特色：
• 每天為您呈現一句精心挑選的古典文學名言
• 基於設備和日期的智能選擇系統，確保每天都有獨特的體驗
• 精美的用戶界面，專注於內容呈現
• 離線工作，無需網絡連接
• 倒計時顯示，提醒您明天的名言

📚 內容來源：
應用包含365句精心挑選的中國古典文學名言，涵蓋詩詞、古文、經典語錄等。

🎯 使用方式：
打開應用，即可看到今天的名言。每台設備在同一天會看到相同的名言，但不同設備會看到不同的內容，為您帶來獨特的個人化體驗。

無需註冊，無需登錄，打開即用。讓古典文學的智慧陪伴您的每一天。
```

#### Keywords (100 characters max)
```
古典文學,名言,每日,智慧,中文,詩詞,古文,勵志,傳統文化
```

#### Support URL
- Required: A website URL where users can get support
- Can be a simple landing page or GitHub page
- Example: `https://yourwebsite.com/support`

#### Marketing URL (Optional)
- Optional: A website for marketing the app

#### Promotional Text (Optional)
- Can be updated without app review
- Use for promotions, updates, etc.

### 4. App Review Information

#### Contact Information
- **First Name**: [Your first name]
- **Last Name**: [Your last name]
- **Phone**: [Your phone number]
- **Email**: [Your email]

#### Demo Account (if applicable)
- Not needed for this app (no login required)

#### Notes for Review
```
This app displays daily Chinese classical literature quotes. 
It works offline and does not require any user accounts or login.
The app uses device identifiers only for deterministic quote selection 
and does not transmit any data to external servers.
```

### 5. Pricing and Availability

- **Price**: Free (or set your price)
- **Availability**: Select countries/regions
- **Pre-orders**: Not applicable for first release

### 6. Version Information

- **Version**: 1.0.0 (from `pubspec.yaml`)
- **Build Number**: 1 (increment for each submission)
- **Copyright**: © [Year] [Your Name/Company]

## 🚀 Submission Process

1. **Complete App Store Listing**:
   - Fill in all required fields
   - Upload screenshots
   - Add descriptions
   - Set pricing

2. **Build Status**:
   - Wait for "Processing" to complete (can take 10-30 minutes)
   - Status will change to "Ready to Submit"

3. **Submit for Review**:
   - In App Store Connect, go to your app
   - Click **+ Version or Platform** if needed
   - Fill in "What's New in This Version"
   - Answer export compliance questions
   - Click **Submit for Review**

4. **Review Process**:
   - Typically takes 24-48 hours
   - You'll receive email notifications
   - Status updates in App Store Connect

## ⚠️ Common Issues & Solutions

### Issue: "Bundle ID not found"
**Solution**: Register the bundle ID in Apple Developer portal first

### Issue: "Invalid Bundle"
**Solution**: 
- Clean build: `flutter clean && flutter pub get`
- Rebuild: `flutter build ios --release`
- Re-archive in Xcode

### Issue: "Missing Compliance"
**Solution**: Answer export compliance questions in App Store Connect

### Issue: "Missing Privacy Policy"
**Solution**: Host privacy policy on a public website and add URL

### Issue: "Invalid Screenshots"
**Solution**: Ensure screenshots match exact pixel dimensions

## 📝 Post-Submission

- Monitor review status
- Respond to reviewer questions if needed
- Once approved, app will be live in App Store
- Monitor for crashes or issues

## 🔄 Updates

For future updates:
1. Increment version in `pubspec.yaml` (e.g., 1.0.1)
2. Increment build number (e.g., 1.0.1+2)
3. Build and archive again
4. Upload new build
5. Update "What's New" section
6. Submit for review

---

**Next Steps**:
1. ✅ Bundle ID updated
2. ⏳ Host privacy policy online
3. ⏳ Register bundle ID in Apple Developer portal
4. ⏳ Build and archive app
5. ⏳ Create App Store Connect listing
6. ⏳ Upload screenshots
7. ⏳ Submit for review

**Estimated Time**: 2-4 hours for setup + 24-48 hours for review

