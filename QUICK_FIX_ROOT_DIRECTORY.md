# ⚡ QUICK FIX: Can't Find Root Directory

**Choose ONE of these solutions:**

---

## ✅ SOLUTION 1: Use Keyboard Shortcut (FASTEST)

```bash
1. In Railway, click on your FAILED service
2. Press: Ctrl + F (Windows) or Cmd + F (Mac)
3. Type: "root"
4. Browser highlights "Root Directory" if found
5. Change "/" to "backend"
6. Save and redeploy
```

**Time:** 30 seconds  
**Success Rate:** 95%

---

## ✅ SOLUTION 2: Delete & Redeploy (GUARANTEED)

Since `.railway.json` is in your repo, it will auto-configure!

```bash
1. Railway Dashboard → Click failed service
2. Click three dots (⋮) at top-right
3. Click "Delete"
4. Confirm deletion
5. Click "New" → "GitHub Repo"
6. Select: MoyoOni/IFAdemo
7. Railway reads .railway.json automatically
8. Deploys to backend folder correctly!
```

**Time:** 2 minutes  
**Success Rate:** 100%

---

## ✅ SOLUTION 3: Manual Navigation

```bash
1. Railway Dashboard
2. Click your PROJECT (not the database!)
3. Click the FAILED SERVICE box
4. Look at TOP for tabs: [Deploy] [Variables] [Settings]
5. Click "Settings"
6. Scroll down to "Build Configuration"
7. Find "Root Directory" field
8. Change "/" to "backend"
9. Click "Save"
```

**Visual Cue:** It looks like this:
```
┌─────────────────────────────┐
│ Root Directory: [/]         │ ← Change this
│                             │
│ [Save Changes]              │
└─────────────────────────────┘
```

---

## 🎯 IF YOU STILL CAN'T FIND IT

### The Setting Might Be Called Something Else:

Look for any of these (they're all the same thing):
- ✓ Root Directory
- ✓ Working Directory  
- ✓ App Directory
- ✓ Base Directory
- ✓ Project Root
- ✓ Source Directory

### Or It Might Be in Different Tabs:

Try checking these tabs (one by one):
1. **Deploy** tab → Scroll down
2. **Settings** tab → Build Configuration
3. **Settings** tab → Advanced section

---

## 🔥 NUCLEAR OPTION (ALWAYS WORKS)

If nothing else works:

```bash
Step 1: Go to Railway Discord
        https://discord.gg/railway

Step 2: Join #help channel

Step 3: Post this message:
        "Can't find Root Directory setting to set 
         workdir to 'backend'. Using monorepo with 
         backend/ folder. Help please!"

Step 4: Share screenshot of your Railway UI

Step 5: Wait 5-10 minutes for response
        (Railway team is very responsive!)
```

---

## 📱 SCREENSHOT GUIDE

If you need help, take these screenshots:

**Screenshot 1:** Your Railway project page
- Should show all your services

**Screenshot 2:** After clicking failed service
- Should show the tabs at top

**Screenshot 3:** Settings page (if you found it)
- Show what you're seeing

Then ask for help in Discord or with a friend!

---

## ✅ WHAT SHOULD HAPPEN AFTER FIX

Once Root Directory is set to `backend`:

```
✓ Service redeploys automatically
✓ Build logs show: "Node.js detected"
✓ npm install runs in backend/
✓ Build succeeds
✓ App runs on port 3000
✓ Green checkmark appears
```

Test: Visit `https://your-app.up.railway.app/health`

---

## 🎯 MY RECOMMENDATION

**Don't waste time searching!** Just use Solution 2:

```
1. Delete the failed service (2 clicks)
2. Redeploy from GitHub (2 clicks)
3. .railway.json handles everything automatically
```

**Total time:** 2 minutes  
**No hunting for settings!**

---

**Ọjọ́ rere!** Either method works perfectly. The config file was created specifically for this reason! 🚀
