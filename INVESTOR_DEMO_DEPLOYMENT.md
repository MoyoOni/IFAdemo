# 🚀 Investor Demo Deployment Guide
## Ìlú Àṣẹ - Production Deployment for Nigerian Investors

**Last Updated:** March 5, 2026  
**Target Audience:** Investors in Nigeria and Diaspora  
**Estimated Setup Time:** 30-45 minutes

---

## 📋 Table of Contents

1. [Quick Start Options](#quick-start-options)
2. [Recommended: Vercel + Railway](#recommended-vercel--railway)
3. [Alternative: Netlify + Supabase](#alternative-netlify--supabase)
4. [Temporary Demo: Ngrok Tunnel](#temporary-demo-ngrok-tunnel)
5. [Nigeria-Specific Optimizations](#nigeria-specific-optimizations)
6. [Post-Deployment Checklist](#post-deployment-checklist)
7. [Troubleshooting](#troubleshooting)

---

## 🎯 Quick Start Options Comparison

| Platform | Setup Time | Cost | Best For | URL Permanence |
|----------|-----------|------|----------|----------------|
| **Vercel + Railway** | 30 min | Free | Professional demos | ✅ Permanent |
| **Netlify + Supabase** | 35 min | Free | Long-term demos | ✅ Permanent |
| **Ngrok Tunnel** | 5 min | Free | Quick testing (hours) | ❌ Changes each session |
| **Fly.io** | 40 min | $5/mo | Full control | ✅ Permanent |

### 🏆 **Recommendation for Nigerian Investors: Vercel + Railway**

**Why?**
- ✅ Fast CDN with Lagos edge locations
- ✅ Professional appearance
- ✅ Free tier sufficient for demo period
- ✅ Auto HTTPS/SSL certificates
- ✅ Mobile-optimized out of the box
- ✅ Low data usage for Nigerian networks

---

## 🚀 Option 1: Vercel + Railway (RECOMMENDED)

### Part A: Deploy Backend to Railway

#### Step 1: Create Railway Account
1. Visit [https://railway.app](https://railway.app)
2. Sign up with GitHub account
3. You'll get $5 free credit (sufficient for 2-3 weeks of demo)

#### Step 2: Set Up PostgreSQL Database
```bash
# In Railway Dashboard:
1. Click "New Project"
2. Select "Deploy PostgreSQL"
3. Wait for database to provision (~2 minutes)
4. Copy the `DATABASE_URL` from Variables tab
```

#### Step 3: Deploy Backend
```bash
# 1. Connect your GitHub repo to Railway
2. In Railway dashboard, click "New" → "GitHub Repo"
3. Select your `ilu_ase` repository
4. Railway will auto-detect it's a NestJS app

# 5. Add environment variables in Railway:
# Go to Variables tab and add:
DATABASE_URL=postgresql://... (from Step 2)
JWT_SECRET=your-secure-jwt-secret-at-least-32-characters
JWT_REFRESH_SECRET=your-secure-refresh-secret-at-least-32-characters
ENCRYPTION_KEY=your-32-character-encryption-key
NODE_ENV=production
FRONTEND_URL=https://your-app.vercel.app (add this after frontend deploy)
PORT=3000

# Optional for demo (disable payment integrations):
PAYSTACK_SECRET_KEY=demo_key
FLUTTERWAVE_SECRET_KEY=demo_key
SENDGRID_API_KEY=skip_for_demo
AWS_ACCESS_KEY_ID=skip_for_demo
AWS_SECRET_ACCESS_KEY=skip_for_demo
```

#### Step 4: Run Database Migrations
```bash
# In Railway, open DevMode or use local Prisma:
npx prisma migrate deploy
npx prisma generate

# Seed demo data for investors:
npm run seed:demo
```

#### Step 5: Note Your Backend URL
Railway will provide: `https://your-app-production.up.railway.app`

---

### Part B: Deploy Frontend to Vercel

#### Step 1: Create Vercel Account
1. Visit [https://vercel.com](https://vercel.com)
2. Sign up with GitHub
3. Free tier includes unlimited deployments

#### Step 2: Import Project
```bash
1. Click "Add New..." → "Project"
2. Import your `ilu_ase` GitHub repository
3. Vercel auto-detects it's a Vite app
```

#### Step 3: Configure Build Settings
```json
Framework Preset: Vite
Build Command: npm run build
Output Directory: frontend/dist
Install Command: npm install
```

#### Step 4: Add Environment Variables
```bash
# In Vercel Project Settings → Environment Variables:
VITE_API_URL=https://your-railway-app.up.railway.app/api
VITE_APP_NAME="Ìlú Àṣẹ"
VITE_MODE=production
```

#### Step 5: Deploy
```bash
1. Click "Deploy"
2. Wait ~3 minutes for build
3. Your app is live at: https://your-app.vercel.app
```

#### Step 6: Update Backend CORS
```bash
# Back in Railway, update FRONTEND_URL variable:
FRONTEND_URL=https://your-app.vercel.app

# Railway will auto-redeploy
```

---

## 🌐 Option 2: Netlify + Supabase

### Part A: Supabase Backend Setup

#### Step 1: Create Supabase Project
1. Visit [https://supabase.com](https://supabase.com)
2. Sign up → "New Project"
3. Choose region: **Europe (London)** - closest to Nigeria
4. Set strong database password

#### Step 2: Get Database Connection String
```bash
1. Go to Project Settings → Database
2. Copy "Connection string" (URI mode)
3. Format: postgresql://postgres:[password]@xxx.supabase.co/postgres
```

#### Step 3: Deploy NestJS to Supabase Edge Functions
```bash
# Install Supabase CLI
npm install -g supabase

# Login
supabase login

# Link project
supabase link --project-ref your-project-ref

# Deploy as function (requires adapter)
# See: docs/SUPABASE_DEPLOYMENT.md
```

**Note:** Supabase works best with their Edge Functions. For full NestJS, consider using their PostgreSQL + deploy backend elsewhere.

---

### Part B: Netlify Frontend

#### Step 1: Connect to GitHub
```bash
1. Visit [https://netlify.com](https://netlify.com)
2. "Add new site" → "Import an existing project"
3. Connect to GitHub, select `ilu_ase`
```

#### Step 2: Build Settings
```
Base directory: frontend
Build command: npm run build
Publish directory: frontend/dist
```

#### Step 3: Environment Variables
```
VITE_API_URL=https://your-backend-url.com/api
VITE_APP_NAME="Ìlú Àṣẹ"
```

#### Step 4: Deploy
```bash
1. Click "Deploy site"
2. Your URL: https://your-app.netlify.app
```

---

## 🔌 Option 3: Ngrok Tunnel (QUICKEST - 5 Minutes)

Perfect for immediate investor calls, but temporary.

### Step 1: Install Ngrok
```bash
# Download from https://ngrok.com/download
# Or install via npm:
npm install -g ngrok

# Sign up for free account at https://ngrok.com
# Get your authtoken
```

### Step 2: Configure Ngrok
```bash
ngrok config add-authtoken YOUR_AUTHTOKEN
```

### Step 3: Start Your App Locally
```bash
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend  
cd frontend
npm run dev
```

### Step 4: Expose Backend
```bash
# Terminal 3 - Ngrok tunnel
ngrok http 3000

# Ngrok gives you: https://abc123.ngrok.io
# This is your public backend URL
```

### Step 5: Update Frontend API Config
```bash
# In frontend/.env or vite.config.ts:
VITE_API_URL=https://abc123.ngrok.io/api

# Restart frontend dev server
```

### Step 6: Share with Investors
```
Frontend: http://localhost:5173
Backend: https://abc123.ngrok.io/api

⚠️ LIMITATION: Investors need you to screen-share since 
frontend runs on your localhost only.

💡 BETTER: Use ngrok on BOTH ports:
ngrok http 5173  # Gives https://xyz456.ngrok.io for frontend
ngrok http 3000  # Gives https://abc123.ngrok.io for backend
```

**Pros:**
- ✅ Ready in 5 minutes
- ✅ No deployment needed
- ✅ Works with local development

**Cons:**
- ❌ URL changes every session
- ❌ Must keep your computer running
- ❌ Not professional for email sharing
- ❌ Limited to 1-2 hour sessions on free tier

---

## 🇳🇬 Nigeria-Specific Optimizations

### Critical for Nigerian Internet Conditions

#### 1. Enable Aggressive Compression
```bash
# In backend/src/main.ts, ensure gzip is enabled:
app.use(compression({
  level: 9, // Maximum compression
  threshold: 1024, // Compress anything > 1KB
}));
```

#### 2. Optimize Images for Low Bandwidth
```bash
# All images already optimized per IMAGE_OPTIMIZATION_GUIDE.md
# Ensure WebP format is served
# Lazy loading enabled on all images
```

#### 3. Enable Service Worker (PWA)
```bash
# Already configured in vite.config.ts
# Ensures app works offline after first load
# Critical for areas with unstable internet
```

#### 4. Reduce Initial Bundle Size
```bash
# Check current bundle size:
cd frontend
npm run build:analyze

# Target: < 500KB initial load
# Current chunks are already split optimally
```

#### 5. Add Loading States
```typescript
// Ensure all async operations show loading skeletons
// Already implemented with Radix UI components
```

#### 6. Configure CDN Edge Locations
```bash
# Vercel automatically routes through Lagos edge
# Verify in Vercel dashboard → Analytics → Performance
```

---

## ✅ Post-Deployment Checklist

### Before Sending to Investors

- [ ] **Test on Mobile Network**
  ```bash
  # Use Chrome DevTools → Network throttling
  # Simulate 3G/4G speeds common in Nigeria
  ```

- [ ] **Verify All Core Features**
  ```bash
  ✓ User registration/login
  ✓ Role-based navigation (Babalawo/Client/Admin)
  ✓ Search functionality
  ✓ Profile viewing
  ✓ Video call interface (if demoing)
  ✓ Payment flow (even if mock)
  ```

- [ ] **Performance Checks**
  ```bash
  ✓ First Contentful Paint < 3 seconds on 3G
  ✓ Time to Interactive < 5 seconds
  ✓ Lighthouse score > 85
  ```

- [ ] **SEO & Metadata**
  ```bash
  ✓ Title: "Ìlú Àṣẹ - Digital Nexus for Isese/Ifá"
  ✓ Description includes "Nigeria", "Yoruba", "Spirituality"
  ✓ Open Graph tags for social sharing
  ```

- [ ] **Error Handling**
  ```bash
  ✓ Custom error pages (404, 500)
  ✓ Graceful degradation when API fails
  ✓ User-friendly error messages
  ```

- [ ] **Security**
  ```bash
  ✓ HTTPS enforced
  ✓ CORS properly configured
  ✓ No sensitive keys in frontend code
  ✓ Rate limiting enabled
  ```

- [ ] **Demo Data**
  ```bash
  ✓ Seed realistic Nigerian practitioner profiles
  ✓ Include sample clients with Yoruba names
  ✓ Add sample listings with cultural context
  ```

---

## 🛠 Troubleshooting

### Common Issues

#### Issue 1: CORS Errors
```
Error: Access to XMLHttpRequest blocked by CORS policy

Solution:
1. In backend, verify FRONTEND_URL matches your Vercel URL exactly
2. Ensure no trailing slashes
3. Redeploy backend after changing CORS settings
```

#### Issue 2: Database Connection Fails
```
Error: Cannot connect to database

Solution:
1. In Railway/Supabase, check DATABASE_URL format
2. Ensure SSL is enabled: add ?sslmode=require to connection string
3. Verify database is publicly accessible (not VPC-only)
```

#### Issue 3: Build Fails on Vercel
```
Error: Build failed with exit code 1

Solution:
1. Check Vercel build logs
2. Common fix: Clear cache → Settings → Builds → Clear Build Cache
3. Ensure Node version matches: add .nvmrc file with "20.x"
```

#### Issue 4: Slow Loading in Nigeria
```
Problem: High latency

Solutions:
1. Enable Vercel Analytics to identify bottlenecks
2. Compress images further (target < 100KB per image)
3. Enable React.lazy() for route-based code splitting
4. Consider adding a .ng domain for local DNS resolution
```

#### Issue 5: Ngrok URL Expired
```
Problem: Investors can't access after few hours

Solution:
1. Use reserved domains (paid ngrok feature)
2. OR switch to permanent hosting (Vercel/Railway)
3. OR use LocalXoze alternative with longer sessions
```

---

## 📊 Cost Estimates for Demo Period (2-4 Weeks)

| Service | Free Tier | Paid Upgrade Needed | Total Cost |
|---------|----------|---------------------|------------|
| **Vercel** | ✅ Unlimited sites | ❌ No | $0 |
| **Railway** | $5 credit | Maybe ($5-10 for extended demo) | $0-10 |
| **Supabase** | ✅ Free tier sufficient | ❌ No | $0 |
| **Netlify** | ✅ Free tier sufficient | ❌ No | $0 |
| **Domain (optional)** | ❌ N/A | ✅ .com domain | $10-15/year |
| **TOTAL** | | | **$0-25** |

---

## 🎯 Next Steps After Deployment

### 1. Custom Domain (Optional but Professional)
```bash
# Buy domain from Namecheap or GoDaddy (~$10/year)
# Recommended: iluase.com, ilease.ng, etc.

# Connect to Vercel:
1. Vercel Dashboard → Domains → Add Domain
2. Follow DNS configuration instructions
3. Wait 24-48 hours for propagation
```

### 2. Set Up Monitoring
```bash
# Add Sentry for error tracking (free tier):
npm install @sentry/react @sentry/node

# Configure in both frontend and backend
# Get real-time error alerts during investor demos
```

### 3. Prepare Investor Demo Script
```markdown
1. Landing page (3 seconds to load)
2. Quick Access login buttons
3. Babalawo dashboard tour
4. Client experience
5. Search and matching
6. Video call demo (if applicable)
7. Payment flow (mock)
8. Mobile responsiveness
```

### 4. Gather Feedback
```bash
# Add simple feedback form:
- Typeform integration
- Google Forms link
- Or built-in feedback component
```

---

## 📞 Support During Demo

If issues arise during investor presentations:

1. **Immediate fallback**: Have screenshots/video recording ready
2. **Quick redeploy**: Keep local version running for screen-share backup
3. **Status page**: Monitor Railway/Vercel dashboards for uptime

---

## 🎉 Success Metrics

After deployment, verify:
- ✅ Loads in < 5 seconds on Nigerian 4G
- ✅ Works on mobile devices (test on actual phones, not just browser dev tools)
- ✅ All core flows complete without errors
- ✅ Looks professional and trustworthy
- ✅ Cultural elements properly represented

---

**Ready to deploy?** Start with Option 1 (Vercel + Railway) for the most professional investor-ready demo.

Need help? Reference the specific troubleshooting section or check individual service documentation.

**Ọjọ́ rere!** (Good luck!)
