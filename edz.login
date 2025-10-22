<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login & Sign Up - Calorie Calculator</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    :root {
      --dark-bg: #0e0e0e;
      --darker-bg: #101010;
      --card-bg: rgba(36, 36, 36, 0.65);
      --accent: #43a047;
      --accent-light: #66bb6a;
      --text-light: #f5f5f5;

      --warm-bg1: #fff7e6;
      --warm-bg2: #ffe5b4;
      --warm-card: rgba(255, 255, 255, 0.9);
      --warm-green: #4caf50;
      --warm-accent: #ffb74d;
      --text-dark: #1b1b1b;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: linear-gradient(120deg, var(--dark-bg) 0%, var(--darker-bg) 100%);
      color: var(--text-light);
      transition: background 0.5s, color 0.5s;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
      overflow: hidden;
      position: relative;
    }

    /* Light mode styles */
    body.light-mode {
      background: linear-gradient(120deg, var(--warm-bg1) 0%, var(--warm-bg2) 100%);
      color: var(--text-dark);
    }

    .container {
      background: var(--card-bg);
      backdrop-filter: blur(20px) saturate(150%);
      -webkit-backdrop-filter: blur(20px) saturate(150%);
      padding: 40px 30px;
      border-radius: 18px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.6);
      width: 100%;
      max-width: 400px;
      transition: background 0.5s, color 0.5s;
      position: relative;
      overflow: hidden;
    }

    body.light-mode .container {
      background: var(--warm-card);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    }

    .logo {
      font-size: 2em;
      font-weight: bold;
      color: var(--accent-light);
      margin-bottom: 18px;
      text-align: center;
    }

    body.light-mode .logo {
      color: var(--warm-green);
    }

    .tabs { display: flex; justify-content: center; margin-bottom: 20px; gap: 10px; }
    .tab-btn {
      flex: 1;
      background: rgba(255, 255, 255, 0.08);
      color: var(--accent-light);
      border: none;
      border-radius: 8px 8px 0 0;
      padding: 12px 0;
      font-size: 1.1em;
      cursor: pointer;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }
    .tab-btn.active { background: linear-gradient(135deg, var(--accent) 70%, var(--accent-light) 100%); color: #fff; }
    body.light-mode .tab-btn { background: #f0f9f3; color: var(--warm-green); }
    body.light-mode .tab-btn.active { background: linear-gradient(135deg, var(--warm-green) 70%, var(--warm-accent) 100%); color: #fff; }

    .form-wrapper { position: relative; height: auto; overflow: hidden; }
    form { opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease, transform 0.5s ease; display: none; }
    form.active { display: block; opacity: 1; transform: translateY(0); }

    #signupForm { max-height: 380px; overflow-y: auto; padding-right: 8px; scrollbar-width: thin; scrollbar-color: var(--accent-light) rgba(255, 255, 255, 0.1); }
    #signupForm::-webkit-scrollbar { width: 8px; }
    #signupForm::-webkit-scrollbar-thumb { background-color: var(--accent-light); border-radius: 8px; }
    #signupForm::-webkit-scrollbar-track { background: rgba(255, 255, 255, 0.1); }

    .fade-out { opacity: 0; transform: scale(0.95); transition: opacity 0.5s ease, transform 0.5s ease; }
    .page-fade-out { opacity: 0; transform: scale(0.9); transition: opacity 0.8s ease, transform 0.8s ease; }

    label { display: block; margin-bottom: 6px; color: var(--accent-light); font-weight: 500; }
    body.light-mode label { color: var(--warm-green); }

    input, select {
      width: 100%;
      padding: 10px;
      margin-bottom: 18px;
      border-radius: 8px;
      border: 1px solid var(--accent-light);
      background: #2b2b2b;
      color: var(--text-light);
      font-size: 1em;
      outline: none;
      transition: background 0.3s, border 0.3s;
    }

    input:focus, select:focus { border-color: var(--accent); background: #333; }
    body.light-mode input, body.light-mode select {
      background: #fff; color: var(--text-dark); border: 1px solid var(--warm-green);
    }
    body.light-mode input:focus, body.light-mode select:focus { background: #f0f9f3; border-color: var(--warm-accent); }

    .submit-btn {
      width: 100%;
      background: linear-gradient(135deg, var(--accent) 70%, var(--accent-light) 100%);
      color: #fff;
      border: none;
      border-radius: 8px;
      padding: 12px 0;
      font-size: 1.1em;
      cursor: pointer;
      transition: transform 0.2s, background 0.3s;
      position: relative;
      overflow: hidden;
    }

    .submit-btn:hover { transform: scale(1.03); background: linear-gradient(135deg, var(--accent-light) 70%, var(--accent) 100%); }
    body.light-mode .submit-btn { background: linear-gradient(135deg, var(--warm-green) 70%, var(--warm-accent) 100%); }

    .link { display: block; margin-top: 18px; text-align: center; color: var(--accent-light); text-decoration: none; transition: color 0.3s; }
    .link:hover { color: var(--accent); }
    body.light-mode .link { color: var(--warm-green); }
    body.light-mode .link:hover { color: var(--warm-accent); }
  </style>
</head>
<body>
  <div class="container" id="pageContainer">
    <div class="logo">Calorie Calculator</div>
    <div class="tabs">
      <button class="tab-btn active" onclick="showTab('login')">Login</button>
      <button class="tab-btn" onclick="showTab('signup')">Sign Up</button>
    </div>
    <div class="form-wrapper">
      <form id="loginForm" class="active">
        <label>Email</label>
        <input type="email" required>
        <label>Password</label>
        <input type="password" required>
        <button type="submit" class="submit-btn">Login</button>
        <a href="#" class="link">Forgot password?</a>
      </form>
      <form id="signupForm">
        <label>Name</label>
        <input type="text" required>
        <label>Email</label>
        <input type="email" required>
        <label>Password</label>
        <input type="password" required>
        <label>Age</label>
        <input type="number" min="1" required>
        <label>Height (cm)</label>
        <input type="number" min="1" id="height" required>
        <label>Weight (kg)</label>
        <input type="number" min="1" id="weight" required>
        <div id="bmiResult" style="margin-bottom: 18px; font-weight: 600; color: var(--accent-light);"></div>
        <label>Goal</label>
        <select required>
          <option value="">Select your goal</option>
          <option value="Lose Weight">Lose Weight</option>
          <option value="Maintain Weight">Maintain Weight</option>
          <option value="Gain Weight">Gain Weight</option>
          <option value="Build Muscle">Build Muscle</option>
          <option value="Improve Health">Improve Health</option>
        </select>
        <button type="submit" class="submit-btn">Sign Up</button>
      </form>
    </div>
  </div>

  <script>
    // Apply theme from localStorage (set on homepage)
    if(localStorage.getItem('theme') === 'light') {
      document.body.classList.add('light-mode');
    }

    // Tabs
    function showTab(tab) {
      const loginForm = document.getElementById('loginForm');
      const signupForm = document.getElementById('signupForm');
      const buttons = document.querySelectorAll('.tab-btn');
      buttons.forEach(btn => btn.classList.remove('active'));
      if (tab === 'login') {
        buttons[0].classList.add('active');
        signupForm.classList.remove('active');
        setTimeout(() => loginForm.classList.add('active'), 100);
      } else {
        buttons[1].classList.add('active');
        loginForm.classList.remove('active');
        setTimeout(() => signupForm.classList.add('active'), 100);
      }
    }

    // BMI calculator
    const heightInput = document.getElementById('height');
    const weightInput = document.getElementById('weight');
    const bmiDisplay = document.getElementById('bmiResult');

    function calculateBMI() {
      const height = parseFloat(heightInput.value);
      const weight = parseFloat(weightInput.value);
      if (height > 0 && weight > 0) {
        const heightM = height / 100;
        const bmi = weight / (heightM * heightM);
        let status = '';
        if (bmi < 18.5) status = 'Underweight';
        else if (bmi < 25) status = 'Normal';
        else if (bmi < 30) status = 'Overweight';
        else status = 'Obese';
        bmiDisplay.textContent = `BMI: ${bmi.toFixed(1)} (${status})`;
      } else {
        bmiDisplay.textContent = '';
      }
    }

    heightInput.addEventListener('input', calculateBMI);
    weightInput.addEventListener('input', calculateBMI);

    // Smooth transition from Sign Up → Login
    document.getElementById('signupForm').addEventListener('submit', function(e) {
      e.preventDefault();
      const form = this;
      form.classList.add('fade-out');
      setTimeout(() => {
        form.classList.remove('fade-out', 'active');
        showTab('login');
      }, 600);
    });

    // Smooth page transition (Login → Homepage)
    document.getElementById('loginForm').addEventListener('submit', function(e) {
      e.preventDefault();
      const container = document.getElementById('pageContainer');
      container.classList.add('page-fade-out');
      setTimeout(() => {
        window.location.href = 'Homepage.html';
      }, 800);
    });
  </script>
</body>
</html>
