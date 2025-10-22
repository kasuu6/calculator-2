<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Calorie Calculator - Your Path to a Healthier You</title>
  <script src="https://kit.fontawesome.com/your-font-awesome-kit-id.js" crossorigin="anonymous"></script>
  <style>
    :root {
      --dark-bg: #1b1b1b;
      --darker-bg: #121212;
      --card-bg: #242424;
      --accent: #43a047;
      --accent-light: #66bb6a;
      --text-light: #e0e0e0;
      --text-dark: #1b1b1b;

      /* Light mode warm theme */
      --warm-bg1: #fff7e6;
      --warm-bg2: #ffe5b4;
      --warm-card: #fff8ef;
      --warm-green: #4caf50;
      --warm-orange: #ffa726;
      --warm-accent: #ffb74d;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      color: var(--text-light);
      background: linear-gradient(120deg, var(--dark-bg) 0%, var(--darker-bg) 100%);
      line-height: 1.6;
      overflow-x: hidden;
      transition: background 0.5s, color 0.5s;
      position: relative;
      z-index: 0;
    }

    /* 🌌 Background Overlay Layer */
    body::before {
      content: "";
      position: fixed;
      inset: 0;
      background: 
        radial-gradient(circle at 20% 30%, rgba(67,160,71,0.15), transparent 60%),
        radial-gradient(circle at 80% 70%, rgba(102,187,106,0.12), transparent 60%),
        linear-gradient(120deg, rgba(255,255,255,0.05) 0%, rgba(0,0,0,0.15) 100%);
      backdrop-filter: blur(2px);
      z-index: -1;
      pointer-events: none;
    }

    body::after {
      content: "";
      position: fixed;
      inset: 0;
      background: repeating-linear-gradient(
        45deg,
        rgba(255,255,255,0.015) 0,
        rgba(255,255,255,0.015) 2px,
        transparent 2px,
        transparent 4px
      );
      mix-blend-mode: overlay;
      opacity: 0.6;
      z-index: -1;
      pointer-events: none;
    }

    /* HEADER */
    header {
      background: rgba(17,17,17,0.95);
      border-bottom: 2px solid var(--accent);
      padding: 16px 32px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: sticky;
      top: 0;
      z-index: 999;
      transition: background 0.5s, border-color 0.5s;
      backdrop-filter: blur(10px);
    }

    .logo {
      font-size: 1.8em;
      font-weight: bold;
      color: var(--accent-light);
      letter-spacing: 1px;
      transition: color 0.5s;
    }

    .header-btn {
      background: linear-gradient(135deg, var(--accent) 70%, var(--accent-light) 100%);
      color: #fff;
      padding: 10px 20px;
      border-radius: 8px;
      text-decoration: none;
      transition: 0.3s;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.4);
    }

    .header-btn:hover {
      background: linear-gradient(135deg, #2e7d32, var(--accent));
      transform: scale(1.05);
    }

    .theme-toggle {
      background: none;
      border: none;
      font-size: 1.5em;
      cursor: pointer;
      color: var(--accent-light);
      margin-right: 16px;
      transition: transform 0.3s;
    }

    .theme-toggle:hover {
      transform: rotate(20deg);
    }

    /* HERO SECTION */
    .hero {
      background: url('images/fitness-bg.jpg') center/cover no-repeat;
      position: relative;
      text-align: center;
      padding: 120px 20px;
      transition: background 0.5s;
      overflow: hidden;
    }

    .hero::before {
      content: "";
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.6);
      backdrop-filter: blur(4px);
      z-index: 0;
      transition: background 0.5s;
    }

    .hero::after {
      content: "";
      position: absolute;
      inset: 0;
      background: linear-gradient(120deg, rgba(67,160,71,0.25), transparent 50%, rgba(102,187,106,0.2));
      animation: moveGradient 8s linear infinite alternate;
      z-index: 0;
      opacity: 0.3;
    }

    @keyframes moveGradient {
      from { background-position: 0% 0%; }
      to { background-position: 100% 100%; }
    }

    .hero-content {
      position: relative;
      z-index: 1;
      background: rgba(40, 40, 40, 0.6);
      display: inline-block;
      padding: 40px 60px;
      border-radius: 12px;
      backdrop-filter: blur(6px);
      transition: background 0.5s, color 0.5s;
    }

    .hero h1 {
      font-size: 2.8em;
      margin-bottom: 16px;
      color: var(--accent-light);
      transition: color 0.5s;
    }

    .hero p {
      font-size: 1.1em;
      color: #ccc;
      max-width: 600px;
      margin: 0 auto 30px;
      transition: color 0.5s;
    }

    .cta-button {
      display: inline-block;
      background: linear-gradient(135deg, var(--accent) 70%, var(--accent-light) 100%);
      color: #fff;
      padding: 14px 28px;
      border-radius: 8px;
      text-decoration: none;
      font-weight: 500;
      transition: 0.3s;
    }

    .cta-button:hover {
      transform: scale(1.05);
      background: linear-gradient(135deg, #2e7d32, var(--accent));
    }

    /* FEATURES SECTION */
    .section {
      padding: 80px 20px;
      text-align: center;
      position: relative;
      z-index: 1;
    }

    .section h2 {
      font-size: 2em;
      color: var(--accent-light);
      margin-bottom: 40px;
      position: relative;
      transition: color 0.5s;
    }

    .section h2::after {
      content: "";
      width: 60px;
      height: 3px;
      background: var(--accent-light);
      display: block;
      margin: 16px auto 0;
      border-radius: 2px;
    }

    .features-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 30px;
    }

    .feature-item {
      position: relative;
      background-size: cover;
      background-position: center;
      border-radius: 12px;
      overflow: hidden;
      height: 250px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
      transition: transform 0.3s, box-shadow 0.3s, background 0.5s;
    }

    .feature-item .overlay {
      position: absolute;
      inset: 0;
      background: rgba(0, 0, 0, 0.6);
      transition: background 0.5s;
    }

    .feature-item:hover .overlay {
      background: rgba(0, 0, 0, 0.4);
    }

    .feature-item .content {
      position: absolute;
      inset: 0;
      display: flex;
      flex-direction: column;
      justify-content: center;
      text-align: center;
      color: #fff;
      padding: 20px;
      z-index: 2;
      transition: color 0.5s;
    }

    .feature-item h3 {
      color: var(--accent-light);
      font-size: 1.3em;
      margin-bottom: 10px;
      transition: color 0.5s;
    }

    .feature-item:hover {
      transform: translateY(-6px);
      box-shadow: 0 6px 24px rgba(67, 160, 71, 0.5);
    }

    /* FOOTER */
    footer {
      background: linear-gradient(135deg, #1b5e20 0%, #2e7d32 100%);
      color: #c8e6c9;
      padding: 60px 20px;
      text-align: center;
      transition: background 0.5s, color 0.5s;
      position: relative;
      z-index: 1;
    }

    .footer-links a {
      font-size: 16px;
      margin: 0 10px;
      text-decoration: none;
      color: #bdbdbd;
      transition: color 0.5s;
    }

    .footer-links a:hover {
      text-decoration: underline;
      color: #fff;
    }

    /* 🌞 LIGHT MODE */
    body.light-mode {
      background: linear-gradient(120deg, var(--warm-bg1) 0%, var(--warm-bg2) 100%);
      color: var(--text-dark);
    }

    body.light-mode::before {
      background: 
        radial-gradient(circle at 25% 30%, rgba(255,183,77,0.2), transparent 60%),
        radial-gradient(circle at 80% 70%, rgba(76,175,80,0.15), transparent 60%);
    }

    body.light-mode header {
      background: rgba(255,255,255,0.9);
      border-bottom: 2px solid var(--warm-accent);
      box-shadow: 0 2px 10px rgba(255, 183, 77, 0.3);
      backdrop-filter: blur(8px);
    }

    body.light-mode .logo {
      color: var(--warm-green);
    }

    body.light-mode .header-btn {
      background: linear-gradient(135deg, var(--warm-green) 70%, var(--warm-accent) 100%);
      color: #fff;
    }

    body.light-mode .hero::before {
      background: rgba(255, 255, 255, 0.5);
    }

    body.light-mode .hero-content {
      background: rgba(255, 255, 255, 0.9);
      color: var(--text-dark);
    }

    body.light-mode .hero h1 {
      color: var(--warm-green);
    }

    body.light-mode .hero p {
      color: #4e342e;
    }

    body.light-mode footer {
      background: linear-gradient(135deg, var(--warm-accent) 0%, var(--warm-green) 100%);
      color: #2e2e2e;
    }

    /* ✨ Fade-Out Transition Effect */
    .fade-out {
      opacity: 0;
      transform: scale(0.98);
      filter: blur(3px);
      transition: opacity 0.6s ease, transform 0.6s ease, filter 0.6s ease;
    }

    /* RESPONSIVE */
    @media (max-width: 768px) {
      .hero h1 { font-size: 2em; }
      .hero-content { padding: 30px 20px; }
      .section { padding: 60px 16px; }
    }
  </style>
</head>

<body>
  <header>
    <button id="theme-toggle" class="theme-toggle" title="Toggle Dark/Light Mode">🌙</button>
    <div class="logo">Calorie Calculator</div>
    <a href="login.html" class="header-btn">Login</a>
  </header>

  <main>
    <section class="hero">
      <div class="hero-content">
        <h1>Calculate Your Way to a Healthier You</h1>
        <p>Unlock your nutritional goals with personalized insights and smart meal planning. Start your journey to a balanced life today!</p>
        <a href="login.html" class="cta-button">Start Calculating Now</a>
      </div>
    </section>

    <section class="section features-section">
      <h2>Key Features</h2>
      <div class="features-grid">
        <div class="feature-item" style="background-image: url('images/personalized-insights.jpg');">
          <div class="overlay"></div>
          <div class="content">
            <h3>Personalized Insights</h3>
            <p>Get tailored calorie and nutrition recommendations based on your unique profile and goals.</p>
          </div>
        </div>

        <div class="feature-item" style="background-image: url('images/meal-planning.jpg');">
          <div class="overlay"></div>
          <div class="content">
            <h3>Meal Planning</h3>
            <p>Discover delicious and healthy meal ideas that fit your dietary needs and preferences.</p>
          </div>
        </div>

        <div class="feature-item" style="background-image: url('images/progress-tracking.jpg');">
          <div class="overlay"></div>
          <div class="content">
            <h3>Progress Tracking</h3>
            <p>Monitor your progress with intuitive charts and reports to stay motivated on your journey.</p>
          </div>
        </div>

        <div class="feature-item" style="background-image: url('images/food-database.jpg');">
          <div class="overlay"></div>
          <div class="content">
            <h3>Extensive Food Database</h3>
            <p>Access a vast database of foods with detailed nutritional information for accurate tracking.</p>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer>
    <div class="footer-top">
      <h3>Ready to take control of your health?</h3>
      <a href="login.html" class="cta-button">Join Calorie Calculator Today!</a>
    </div>
    <div class="footer-links">
      <a href="#about">About</a>
      <a href="#features">Features</a>
      <a href="#contact">Contact</a>
      <a href="#privacy">Privacy</a>
    </div>
    <div class="copyright">© 2025 Calorie Calculator. All rights reserved.</div>
  </footer>

  <script>
    // 🌙 Theme Toggle with localStorage
    const toggleBtn = document.getElementById('theme-toggle');
    const body = document.body;

    // Apply stored theme on page load
    const storedTheme = localStorage.getItem('theme');
    if (storedTheme === 'light') {
      body.classList.add('light-mode');
      toggleBtn.textContent = '☀️';
    } else {
      body.classList.add('dark-mode');
      toggleBtn.textContent = '🌙';
    }

    toggleBtn.addEventListener('click', () => {
      if (body.classList.contains('dark-mode')) {
        body.classList.remove('dark-mode');
        body.classList.add('light-mode');
        toggleBtn.textContent = '☀️';
        localStorage.setItem('theme', 'light');
      } else {
        body.classList.remove('light-mode');
        body.classList.add('dark-mode');
        toggleBtn.textContent = '🌙';
        localStorage.setItem('theme', 'dark');
      }
    });

    // ✨ Fade-out transition before going to login.html
    const loginLinks = document.querySelectorAll('a[href="login.html"]');
    loginLinks.forEach(link => {
      link.addEventListener('click', function (e) {
        e.preventDefault();
        document.body.classList.add('fade-out');
        setTimeout(() => {
          window.location.href = this.href;
        }, 600);
      });
    });
  </script>
</body>
</html>
