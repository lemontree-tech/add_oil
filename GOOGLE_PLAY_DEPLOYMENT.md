# Google Play Store Deployment Guide

## ✅ Completed Steps

1. ✅ **App Name**: Set to "加油"
2. ✅ **Privacy Policy**: Hosted at `https://lemontree-tech.github.io/add_oil/PRIVACY.html`
3. ✅ **App Icons**: Configured with flutter_launcher_icons

## ⚠️ Critical Issues to Fix

### 1. Release Signing Configuration
**Location**: `client/android/app/build.gradle.kts:37`
**Issue**: Currently using debug signing keys
**Fix Required**: Create release keystore and configure signing

### 2. INTERNET Permission
**Status**: ✅ Not needed - App is fully offline, no network access required

### 3. Application ID
**Current**: `com.godsword.gods_word_for_the_day`
**Recommendation**: Consider changing to `com.lt.addoil` to match iOS (optional)

## 📋 Pre-Submission Checklist

### Step 1: Fix Release Signing (15 minutes)

1. **Generate keystore**:
```bash
cd client/android/app
keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```
- Enter password (save it securely!)
- Fill in certificate information
- This creates `upload-keystore.jks` file

2. **Create key.properties file**:
```bash
cd client/android
```
Create `key.properties`:
```
storePassword=<your-keystore-password>
keyPassword=<your-key-password>
keyAlias=upload
storeFile=app/upload-keystore.jks
```

3. **Update build.gradle.kts**:
- See instructions below

4. **Add to .gitignore**:
```
client/android/key.properties
client/android/app/upload-keystore.jks
```

### Step 2: Add INTERNET Permission (2 minutes)

Add to `client/android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

### Step 3: Build App Bundle (10 minutes)

```bash
cd client
flutter clean
flutter pub get
flutter build appbundle --release
```

Output: `client/build/app/outputs/bundle/release/app-release.aab`

### Step 4: Create Google Play Console Listing (15 minutes)

1. Go to: https://play.google.com/console
2. Click **Create app**
3. Fill in:
   - **App name**: 加油
   - **Default language**: Chinese (Traditional) or English
   - **App or game**: App
   - **Free or paid**: Free
   - **Privacy Policy**: `https://lemontree-tech.github.io/add_oil/PRIVACY.html`
   - **Declarations**: Complete all required sections

### Step 5: App Content

#### Store Listing

**Short description** (80 characters max):
```
每天一句勵志名言，為您的生活注入正能量與動力。
```

**Full description** (4000 characters max):
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

**App icon**: 512 x 512 pixels (required)
**Feature graphic**: 1024 x 500 pixels (required)
**Screenshots**:
- Phone: At least 2, up to 8 (16:9 or 9:16)
- 7" tablet: Optional
- 10" tablet: Optional

### Step 6: Content Rating

Complete the IARC questionnaire:
- Age rating questions
- Content descriptors
- Typically will be rated 4+ or Everyone

### Step 7: Upload App Bundle

1. Go to **Production** → **Create new release**
2. Upload `app-release.aab`
3. Add release notes (Traditional Chinese):
   ```
   首次發布
   - 每天一句勵志名言
   - 完全離線使用
   - 個人化體驗
   ```
4. Review and roll out

### Step 8: Complete Store Listing

- Upload screenshots
- Add feature graphic
- Complete all required sections
- Set pricing (Free)
- Select countries/regions

### Step 9: Submit for Review

1. Complete all required sections (green checkmarks)
2. Click **Submit for review**
3. Review typically takes 1-3 days

## 🚀 Quick Start Commands

```bash
# 1. Fix signing (one-time setup)
cd client/android/app
keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# 2. Build app bundle
cd client
flutter build appbundle --release

# 3. Upload to Google Play Console
# File location: client/build/app/outputs/bundle/release/app-release.aab
```

## ⚠️ Common Issues

### Issue: "Upload failed: You need to use a different package name"
**Solution**: Change applicationId in `build.gradle.kts` to a unique package name

### Issue: "App not signed"
**Solution**: Ensure release signing is configured correctly

### Issue: "Missing privacy policy"
**Solution**: Add privacy policy URL in Store listing

## 📝 Notes

- App bundle (AAB) is required for new apps (not APK)
- First review may take longer (1-3 days)
- You can publish to internal testing first for testing
- Keep keystore file and passwords secure!

---

**Estimated Time**: 1-2 hours setup + 1-3 days review

