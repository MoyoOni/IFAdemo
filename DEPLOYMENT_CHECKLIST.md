# 🚀 DEPLOYMENT CHECKLIST - Ìlú Àṣẹ Investor Demo

**Target:** Deploy to Vercel (Frontend) + Railway (Backend)  
**Estimated Time:** 30-45 minutes  
**Status:** Ready to Start

---

## ✅ COMPLETED TASKS:

- ✅ Created deployment guide documentation
- ✅ Committed to GitHub repository
- ✅ Repository ready for deployment

---

## 🔴 REMAINING TASKS - DEPLOYMENT STEPS:

### **PHASE 1: Railway Backend Setup** (15 minutes)

#### Step 1.1: Create Railway Account
- [ ] Visit https://railway.app
- [ ] Sign up with GitHub account
- [ ] Claim $5 free credit (no card needed initially)

#### Step 1.2: Deploy PostgreSQL Database
- [ ] In Railway Dashboard: Click "New Project"
- [ ] Select "Deploy PostgreSQL"
- [ ] Wait for provisioning (~2 minutes)
- [ ] Copy `DATABASE_URL` from Variables tab
- [ ] **Save this URL for later**

#### Step 1.3: Generate Security Keys
Run these commands in PowerShell to generate secure keys:

```powershell
# JWT Secret (64 characters)
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"

# Refresh Token Secret (64 characters)
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"

# Encryption Key (exactly 32 characters)
node -e "console.log(require('crypto').randomBytes(16).toString('hex'))"
```

**Save these outputs!** You'll need them in Step 1.5.

#### Step 1.4: Connect Repository to Railway
- [ ] In Railway dashboard, click "New" → "GitHub Repo"
- [ ] Authorize Railway to access GitHub
- [ ] Select repository: `MoyoOni/IFAdemo`
- [ ] Railway auto-detects NestJS backend

#### Step 1.5: Add Environment Variables to Railway
In Railway Variables tab, add these ONE BY ONE:

```
DATABASE_URL=postgresql://... (from Step 1.2)
JWT_SECRET=<paste 64-char hex from Step 1.3>
JWT_REFRESH_SECRET=<paste 64-char hex from Step 1.3>
ENCRYPTION_KEY=<paste 32-char hex from Step 1.3>
NODE_ENV=production
PORT=3000
FRONTEND_URL=https://localhost:5173 (temporary - update after frontend deploy)
PAYSTACK_SECRET_KEY=demo_key
FLUTTERWAVE_SECRET_KEY=demo_key
SENDGRID_API_KEY=skip_for_demo
AWS_ACCESS_KEY_ID=skip_for_demo
AWS_SECRET_ACCESS_KEY=skip_for_demo
AGORA_APP_ID=skip_for_demo
ENABLE_VIRUS_SCAN=false
```

⚠️ **IMPORTANT:** Do NOT include quotes around values!

#### Step 1.6: Run Database Migrations
- [ ] In Railway, click on your project → "Open DevMode"
- [ ] Or run locally after connecting to remote DB:

```bash
cd backend
npx prisma migrate deploy
npx prisma generate
npm run seed:demo
```

#### Step 1.7: Get Your Backend URL
- [ ] Railway provides: `https://your-app-production.up.railway.app`
- [ ] **Save this URL** - you need it for frontend setup

---

### **PHASE 2: Vercel Frontend Setup** (10 minutes)

#### Step 2.1: Create Vercel Account
- [ ] Visit https://vercel.com
- [ ] Sign up with GitHub account
- [ ] Free tier activated automatically

#### Step 2.2: Import Project
- [ ] Click "Add New..." → "Project"
- [ ] Import GitHub repository: `MoyoOni/IFAdemo`
- [ ] Vercel detects Vite framework

#### Step 2.3: Configure Build Settings
Set these in Vercel project settings:

```
Framework Preset: Vite
Build Command: npm run build
Output Directory: frontend/dist
Install Command: npm install
Root Directory: ./ (leave as default)
```

#### Step 2.4: Add Environment Variables to Vercel
In Vercel Settings → Environment Variables:

```
VITE_API_URL=https://your-railway-app.up.railway.app/api
VITE_APP_NAME=Ìlú Àṣẹ
VITE_MODE=production
```

⚠️ **Replace `your-railway-app` with your actual Railway URL!**

#### Step 2.5: Deploy!
- [ ] Click "Deploy"
- [ ] Wait ~3 minutes for build
- [ ] Success message appears
- [ ] Your live URL: `https://your-app.vercel.app`

---

### **PHASE 3: Update Backend CORS** (2 minutes)

#### Step 3.1: Update FRONTEND_URL in Railway
- [ ] Go back to Railway Variables
- [ ] Edit `FRONTEND_URL` variable
- [ ] Change from `https://localhost:5173` to `https://your-app.vercel.app`
- [ ] Railway auto-redeploys (~1 minute)

---

### **PHASE 4: Testing & Verification** (10 minutes)

#### Step 4.1: Test Basic Connectivity
- [ ] Visit your Vercel URL
- [ ] Landing page loads (< 3 seconds)
- [ ] No console errors (check F12 Developer Tools)

#### Step 4.2: Test Authentication
- [ ] Click "Quick Access" login buttons
- [ ] Admin login works
- [ ] Babalawo login works
- [ ] Client login works

#### Step 4.3: Test Core Features
- [ ] Role-based navigation works correctly
- [ ] Dashboard loads for each role
- [ ] Search functionality works
- [ ] Profile pages load
- [ ] All links functional

#### Step 4.4: Mobile Testing
- [ ] Open Chrome DevTools (F12)
- [ ] Toggle device toolbar (Ctrl+Shift+M)
- [ ] Test on iPhone 12 Pro
- [ ] Test on Samsung Galaxy S20
- [ ] Verify responsive layout

#### Step 4.5: Performance Testing
- [ ] In DevTools → Network tab
- [ ] Throttle to "Slow 3G"
- [ ] Page loads in < 5 seconds
- [ ] Images lazy load properly

---

### **PHASE 5: Final Checks** (3 minutes)

#### Step 5.1: Security Verification
- [ ] HTTPS enforced (lock icon in browser)
- [ ] No sensitive keys in frontend code
- [ ] CORS properly configured

#### Step 5.2: Error Handling
- [ ] Visit non-existent page → custom 404 shows
- [ ] Disconnect internet → graceful error messages
- [ ] API errors show user-friendly messages

#### Step 5.3: Cultural Integrity
- [ ] Yoruba diacritics display correctly (Àṣẹ, Babaláwo)
- [ ] Culturally appropriate imagery
- [ ] No AI/magical language

---

## 🎯 SUCCESS CRITERIA:

Before sharing with investors, ensure:

✅ **Performance:**
- First Contentful Paint < 3 seconds
- Time to Interactive < 5 seconds
- Lighthouse score > 85

✅ **Functionality:**
- All Quick Access logins work
- All role dashboards accessible
- Navigation complete (no broken links)
- Search returns results

✅ **Professionalism:**
- No console errors
- Responsive on all devices
- Proper error messages
- Cultural elements respected

✅ **Security:**
- HTTPS everywhere
- No exposed secrets
- CORS locked to your domain

---

## 📞 TROUBLESHOOTING QUICK REFERENCE:

### Issue: CORS Error
**Fix:** Verify `FRONTEND_URL` in Railway matches Vercel URL exactly (no trailing slash)

### Issue: Cannot Connect to Database
**Fix:** Check DATABASE_URL format, ensure SSL mode: `?sslmode=require`

### Issue: Build Fails on Vercel
**Fix:** Clear cache → Settings → Builds → Clear Build Cache and redeploy

### Issue: Blank Page After Deploy
**Fix:** Check VITE_API_URL in Vercel matches Railway URL + `/api`

### Issue: Slow Loading in Nigeria
**Fix:** Enable compression in backend, verify CDN routing through Lagos edge

---

## 📊 POST-DEPLOYMENT METRICS TO TRACK:

Monitor these in Vercel Analytics:

1. **Page Load Time** (target: < 3s)
2. **First Contentful Paint** (target: < 2s)
3. **Time to Interactive** (target: < 4s)
4. **Bounce Rate** (should be low if loading fast)
5. **Mobile vs Desktop** (expect 70%+ mobile for Nigeria)

---

## 🎉 DEPLOYMENT COMPLETE!

Once all checkboxes are marked:

1. **Record your URLs:**
   - Frontend: `https://__________.vercel.app`
   - Backend: `https://__________.up.railway.app`

2. **Prepare investor email:**
   - Include direct link to Vercel app
   - Mention mobile-optimized
   - Highlight Nigerian market optimization

3. **Have backup ready:**
   - Screen recording of demo flow
   - Screenshots of key features
   - Local ngrok fallback if needed

---

**Ọjọ́ rere!** (Good luck!)
