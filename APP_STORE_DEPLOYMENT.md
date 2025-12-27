# Apple App Store Deployment Guide

## ✅ Completed Steps

1. ✅ **Bundle Identifier Updated**: Changed to `com.lt.addoil`
2. ✅ **App Description Updated**: Updated in `pubspec.yaml`
3. ✅ **Privacy Policy Created**: Hosted at `https://lemontree-tech.github.io/add_oil/PRIVACY.html`
4. ✅ **GitHub Pages Set Up**: Website live at `https://lemontree-tech.github.io/add_oil/`

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
- **Privacy Policy URL**: `https://lemontree-tech.github.io/add_oil/PRIVACY.html`
  - ✅ Already hosted and ready
- **Category**: 
  - Primary: Lifestyle or Books
  - Secondary: (optional)
- **Content Rights**: If using copyrighted quotes, ensure you have rights
- **Age Rating**: Complete the questionnaire (likely 4+ or 9+)

### 2. Build & Archive

#### Prerequisites
- [ ] Xcode installed (latest version recommended)
- [ ] Apple Developer account active ($99/year)
- [ ] **Bundle ID `com.lt.addoil` registered in Apple Developer portal** ⚠️ **DO THIS FIRST**
  - Go to: https://developer.apple.com/account/resources/identifiers/list
  - Click **+** → **App IDs** → **App**
  - Description: Add Oil (or 加油)
  - Bundle ID: `com.lt.addoil` (exact match)
  - Click **Continue** → **Register**
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

#### Promotional Text (170 characters max)
```
每天一句勵志名言，為您的生活注入正能量與動力。古典文學的智慧，成為您每天前進的力量。
```

#### App Description

**Short Description** (up to 170 characters):
```
每日智慧 - 基於設備和日期的中文古典文學每日名言應用。每天為您呈現一句精心挑選的古典文學名言。
```

**Long Description** (up to 4000 characters):
```
每日智慧 (加油) 是一款勵志名言應用，每天為您帶來正能量與動力。

✨ 主要特色：
• 每天一句精心挑選的勵志名言，為您的生活注入正能量
• 基於古典文學的智慧結晶，結合現代勵志理念
• 精美的用戶界面，專注於內容呈現
• 完全離線工作，無需網絡連接
• 倒計時顯示，提醒您明天的勵志名言
• 個人化體驗，每台設備在同一天會看到相同的名言，但不同設備會看到不同的內容

💪 勵志力量：
每天一句正能量的名言，幫助您保持積極心態，面對生活中的挑戰。無論是工作壓力、學習困難，還是人生迷茫，這些來自古典文學的智慧都能為您提供指引與動力。

📚 內容來源：
應用包含精心挑選的中國古典文學勵志名言，涵蓋詩詞、古文、經典語錄等，每句都蘊含深刻的人生智慧，激勵您不斷前進。

🎯 使用方式：
打開應用，即可看到今天的勵志名言。無需註冊，無需登錄，打開即用。讓這些充滿正能量的話語陪伴您的每一天，成為您前進的動力。

💡 設計理念：
我們相信，每天接觸一句勵志名言，不僅能激發您的內在動力，更能為日常生活帶來正能量與啟發。無論是早晨醒來的第一句話，還是睡前的最後一句話，都能為您的一天注入力量。

🌟 為什麼選擇我們：
- 精選內容：每句勵志名言都經過精心挑選，確保能為您帶來正能量
- 簡潔設計：專注於內容本身，無廣告干擾，讓您專注於吸收正能量
- 離線使用：無需網絡，隨時隨地都能獲得勵志力量
- 個人化：基於設備的智能選擇，為您帶來獨特體驗
- 完全免費：無內購，無廣告，純粹的正能量體驗

讓這些充滿智慧的勵志名言，成為您每天前進的動力來源。
```

#### Keywords (100 characters max)
```
勵志,正能量,名言,每日,動力,激勵,中文,勵志語錄,每日一句,正能量語錄,勵志名言,激勵,加油
```

#### Support URL
- Required: A website URL where users can get support
- Use: `https://lemontree-tech.github.io/add_oil/` (your GitHub Pages site)

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

## 🎯 Next Steps (Priority Order)

### Step 1: Register Bundle ID (5 min) ⚠️ **DO THIS FIRST**
1. Go to: https://developer.apple.com/account/resources/identifiers/list
2. Click **+** → **App IDs** → **App** → Continue
3. Fill in:
   - **Description**: Add Oil (or 加油)
   - **Bundle ID**: `com.lt.addoil` (must match exactly)
4. Click **Continue** → **Register**

### Step 2: Generate Icons & Build (15 min)
```bash
cd client
flutter pub run flutter_launcher_icons
flutter clean
flutter pub get
flutter build ios --release
```

### Step 3: Archive in Xcode (10 min)
```bash
cd client
open ios/Runner.xcworkspace
```
- Select **Runner** → **Signing & Capabilities**
- Check **Automatically manage signing**
- Select your **Team**
- Verify Bundle ID: `com.lt.addoil`
- **Product** → **Archive**
- **Distribute App** → **App Store Connect** → **Upload**

### Step 4: Create App Store Connect Listing (10 min)
1. Go to: https://appstoreconnect.apple.com
2. **My Apps** → **+** → **New App**
3. Fill in:
   - **Name**: 加油
   - **Bundle ID**: `com.lt.addoil`
   - **SKU**: `addoil-ios-001`
   - **Privacy Policy URL**: `https://lemontree-tech.github.io/add_oil/PRIVACY.html`
   - **Category**: Lifestyle (or Books)

### Step 5: Upload Screenshots (10 min)
- Take screenshots from iOS Simulator (Cmd+S)
- Upload to App Store Connect for required sizes

### Step 6: Submit for Review (5 min)
- Fill in app descriptions
- Answer export compliance
- Click **Submit for Review**

**Total Estimated Time**: ~1.5 hours setup + 24-48 hours review

