# 🔍 HOW TO FIND ROOT DIRECTORY IN RAILWAY

**Problem:** Can't find the "Root Directory" setting  
**Solution:** Follow these exact steps with visual descriptions

---

## 📍 EXACT NAVIGATION STEPS

### Step 1: Go to Railway Dashboard

```
1. Visit: https://railway.app
2. Login with GitHub (if not already)
3. You'll see your Projects page
```

**What you should see:**
- Your project name (probably "IFAdemo" or similar)
- Maybe a PostgreSQL database icon
- Maybe a failed service with red X

---

### Step 2: Open Your Project

```
1. Click on your project box/card
2. This opens the project dashboard
```

**What you should see now:**
- List of services (PostgreSQL, your app service)
- Each service is a rectangular box
- Failed service might show red/orange indicator

---

### Step 3: Select the FAILED Service

```
1. Look for the service that shows the Railpack error
2. It's NOT the PostgreSQL database
3. It should be named something like "IFAdemo", "ilu_ase", or "Node"
4. Click directly on that service box
```

**Important:** Don't click on PostgreSQL - that's your database, not your app!

---

### Step 4: Open Settings Tab

After clicking the service, you should see tabs at the TOP:

```
[Deploy] [Variables] [Settings] [Metrics] [Backups]
          ↑
     Click THIS one!
```

**Click on "Settings"**

---

### Step 5: Find Root Directory

In the Settings page, scroll down slightly and look for sections like:

```
┌─────────────────────────────────────┐
│ Build Configuration                 │
├─────────────────────────────────────┤
│ Builder: Nixpacks ▼                 │
│                                     │
│ Root Directory: [ / ]               │ ← THIS IS IT!
│                                     │
│ Change this to: backend             │
└─────────────────────────────────────┘
```

**The "Root Directory" field might also be labeled as:**
- "Working Directory"
- "App Directory"
- "Base Directory"

It's usually under a section called:
- "Build Configuration"
- "Build Settings"
- Or just "Configuration"

---

## 🎯 WHAT TO DO WHEN YOU FIND IT

### Current Value (Wrong):
```
Root Directory: /
```

### Change To (Correct):
```
Root Directory: backend
```

**Then:**
1. Click "Save" button (usually blue)
2. Wait for it to save
3. Railway will auto-redeploy OR click "Deploy" manually

---

## ❓ STILL CAN'T FIND IT?

### Alternative Location #1:

```
Service View → Deployments tab → Click latest deployment
→ Configuration section → Root Directory
```

### Alternative Location #2:

```
Service View → Settings → Scroll to "Advanced" section
→ Look for "Root Directory" or "Working Directory"
```

### Alternative Location #3:

Sometimes it's in the **Deploy** tab:
```
Service View → Deploy tab → Scroll down
→ Look for "Directory to deploy from"
```

---

## 🔧 ALTERNATIVE SOLUTION: Use Config File

If you absolutely cannot find the setting, the `.railway.json` file I created should work automatically!

### How to Make It Work:

1. **Go back to Railway Dashboard**
2. **Delete the failed service:**
   - Click the three dots (⋮) on the service
   - Click "Delete"
   - Confirm deletion

3. **Redeploy from GitHub:**
   - Click "New" → "GitHub Repo"
   - Select: `MoyoOni/IFAdemo`
   - Railway reads `.railway.json` automatically
   - Should deploy to backend folder correctly!

---

## 📸 VISUAL GUIDE (Text Description)

### What Railway Project Page Looks Like:

```
╔══════════════════════════════════════════╗
║  ← Back    My Project              ⚙️   ║
╠══════════════════════════════════════════╣
║                                          ║
║  SERVICES                                ║
║  ┌──────────────┐  ┌──────────────┐     ║
║  │  PostgreSQL  │  │   IFAdemo    │     ║
║  │   Database   │  │   Node App   │     ║
║  │   ✅ Running │  │   ❌ Failed  │     ║
║  └──────────────┘  └──────────────┘     ║
║       ↑ CLICK               ↑ CLICK      ║
║     to open DB        to open App        ║
║                                          ║
╚══════════════════════════════════════════╝
```

### After Clicking Failed Service:

```
╔══════════════════════════════════════════╗
║  IFAdemo                                 ║
╠══════════════════════════════════════════╣
║  [Deploy] [Variables] [Settings] [⋯]    ║
║                            ↑ CLICK HERE  ║
╚══════════════════════════════════════════╝

After clicking Settings:
╔══════════════════════════════════════════╗
║  Settings                                ║
╠══════════════════════════════════════════╣
║  Build Configuration                     ║
║  ┌────────────────────────────────────┐ ║
║  │ Builder:  [Nixpacks ▼]             │ ║
║  │                                    │ ║
║  │ Root Directory: [/]                │ ║
║  │                    ↑ CHANGE THIS   │ ║
║  │                    to: backend     │ ║
║  │                                    │ ║
║  │ [Save]                             │ ║
║  └────────────────────────────────────┘ ║
╚══════════════════════════════════════════╝
```

---

## 🆘 EMERGENCY WORKAROUND

If the setting truly doesn't exist in your Railway UI:

### Method: Delete and Redeploy with Config File

Since `.railway.json` is in your repo, use it!

```bash
Step 1: In Railway Dashboard
        → Click three dots (⋮) on failed service
        → Delete
        → Confirm

Step 2: Click "New" 
        → "GitHub Repo"
        → Select: MoyoOni/IFAdemo
        
Step 3: Railway reads .railway.json automatically
        → Should detect backend folder
        → Deploys correctly!
```

---

## ✅ VERIFICATION AFTER FIX

Once you change Root Directory to `backend`:

### Expected Build Logs:
```
✓ Detected Node.js
✓ Installing dependencies in backend/
✓ npm install completed
✓ npm run build completed
✓ Starting application...
✓ Server running on port 3000
```

### Test It Works:
```bash
Visit: https://your-railway-url.up.railway.app/health
Should see: {"status":"ok","timestamp":"..."}
```

---

## 💡 PRO TIP

**Keyboard Shortcut to Find Settings:**

While viewing your service, press:
```
Ctrl + F (or Cmd + F on Mac)
Type: "root" or "directory"
Browser will highlight if found on page
```

---

## 📞 IF STILL STUCK

### Take These Screenshots:

1. **Screenshot 1:** Your Railway project page (showing all services)
2. **Screenshot 2:** After clicking the failed service
3. **Screenshot 3:** The Settings tab contents

Then:
- Check Railway Discord: https://discord.gg/railway
- Ask in #help channel
- Show your screenshots
- Community will help quickly!

---

## 🎯 QUICK SUMMARY

**What to do RIGHT NOW:**

```
1. Railway Dashboard → Click your project
2. Click the FAILED service (not PostgreSQL!)
3. Click "Settings" tab at top
4. Scroll down to "Build Configuration"
5. Find "Root Directory" field
6. Change from "/" to "backend"
7. Click Save
8. Redeploy
```

**If you can't find it after 2 minutes:**
- Use the workaround: Delete service and redeploy
- The `.railway.json` file will handle it automatically

---

**You've got this!** The setting is there, just follow the visual guide step-by-step. If not, the config file workaround works perfectly too! 🚀
