# 🎯 QUICK START DEPLOYMENT SCRIPT

This PowerShell script helps you deploy to Railway + Vercel quickly.

## Prerequisites

1. GitHub account linked to https://github.com/MoyoOni/IFAdemo
2. Railway account (free) - https://railway.app
3. Vercel account (free) - https://vercel.com

## Quick Deploy Steps

### Step 1: Generate Security Keys
Run this first to get your security keys:

```powershell
Write-Host "=== Generating Security Keys ===" -ForegroundColor Cyan
Write-Host ""

Write-Host "JWT_SECRET (64 characters):" -ForegroundColor Yellow
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
Write-Host ""

Write-Host "JWT_REFRESH_SECRET (64 characters):" -ForegroundColor Yellow
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
Write-Host ""

Write-Host "ENCRYPTION_KEY (32 characters):" -ForegroundColor Yellow
node -e "console.log(require('crypto').randomBytes(16).toString('hex'))"
Write-Host ""

Write-Host "⚠️ SAVE THESE KEYS! You'll need them in Railway." -ForegroundColor Red
```

### Step 2: Deploy to Railway

1. Go to https://railway.app
2. Click "New Project" → "Deploy PostgreSQL"
3. Copy the DATABASE_URL
4. Click "New" → "GitHub Repo" → Select `MoyoOni/IFAdemo`
5. Add these environment variables in Railway:

```
DATABASE_URL=<paste from Railway>
JWT_SECRET=<from Step 1>
JWT_REFRESH_SECRET=<from Step 1>
ENCRYPTION_KEY=<from Step 1>
NODE_ENV=production
PORT=3000
FRONTEND_URL=https://localhost:5173
PAYSTACK_SECRET_KEY=demo_key
FLUTTERWAVE_SECRET_KEY=demo_key
SENDGRID_API_KEY=skip_for_demo
AWS_ACCESS_KEY_ID=skip_for_demo
AWS_SECRET_ACCESS_KEY=skip_for_demo
AGORA_APP_ID=skip_for_demo
ENABLE_VIRUS_SCAN=false
```

6. Railway deploys automatically!
7. Copy your Railway URL: `https://__________.up.railway.app`

### Step 3: Deploy to Vercel

1. Go to https://vercel.com
2. Click "Add New..." → "Project"
3. Import: `MoyoOni/IFAdemo`
4. Framework Preset: Vite (auto-detected)
5. Build Command: `npm run build`
6. Output Directory: `frontend/dist`
7. Add environment variables:

```
VITE_API_URL=https://__________.up.railway.app/api
VITE_APP_NAME=Ìlú Àṣẹ
VITE_MODE=production
```

8. Click "Deploy"
9. Wait ~3 minutes
10. Copy your Vercel URL: `https://__________.vercel.app`

### Step 4: Update Railway CORS

1. Back in Railway, edit `FRONTEND_URL` variable
2. Change to: `https://__________.vercel.app`
3. Railway auto-redeploys

### Step 5: Test!

Visit your Vercel URL and test all features!

---

## Verification Commands

### Check Backend Health
```powershell
$backendUrl = "https://your-railway-app.up.railway.app"
Invoke-RestMethod "$backendUrl/health"
```

### Check Frontend Build
```powershell
cd frontend
npm run build
# Should complete without errors
```

### Test API Connection
```powershell
$backendUrl = "https://your-railway-app.up.railway.app"
try {
    $response = Invoke-RestMethod "$backendUrl/api/health" -ErrorAction Stop
    Write-Host "✅ Backend is healthy!" -ForegroundColor Green
} catch {
    Write-Host "❌ Backend connection failed" -ForegroundColor Red
}
```

---

## Common Issues & Fixes

### CORS Error
**Problem:** Frontend can't connect to backend  
**Fix:** Ensure FRONTEND_URL in Railway exactly matches Vercel URL (no trailing slash)

### Database Connection Failed
**Problem:** Can't connect to PostgreSQL  
**Fix:** Add `?sslmode=require` to DATABASE_URL

### Build Fails on Vercel
**Problem:** Exit code 1  
**Fix:** Settings → Builds → Clear Cache, then redeploy

### Blank Page
**Problem:** White screen after deploy  
**Fix:** Check VITE_API_URL includes `/api` at the end

---

## Next Steps After Successful Deploy

1. ✅ Test on mobile devices
2. ✅ Test on Nigerian network speeds (use DevTools throttling)
3. ✅ Verify all Quick Access logins work
4. ✅ Record demo video as backup
5. ✅ Send to investors!

---

**Support:** If issues arise, check DEPLOYMENT_CHECKLIST.md for detailed troubleshooting.
