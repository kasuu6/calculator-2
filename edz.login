<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login & Sign Up - Calorie Calculator</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    :root {
  /* Light mode colors */
  --bg-gradient-light: linear-gradient(120deg, #e8fdf1 0%, #f6fff9 100%);
  --card-bg-light: #ffffff;
  --text-color-light: #1e3923;
  --accent-light: #43a047;
  --accent-light2: #66bb6a;
  --field-bg-light: #f0f9f3;
  --field-bg-light-focus: #e3f7ea;
  --border-color-light: #81c784;

  /* Dark mode colors */
  --bg-gradient-dark: linear-gradient(120deg, #0f1c12 0%, #1a2e1d 100%);
  --card-bg-dark: #16251a;
  --text-color-dark: #e6f6ec;
  --accent-dark: #66bb6a;
  --accent-dark2: #81c784;
  --field-bg-dark: #203324;
  --field-bg-dark-focus: #294a33;
  --border-color-dark: #43a047;
}

/* Default light mode */
body {
  font-family: 'Segoe UI', Arial, sans-serif;
  margin: 0;
  padding: 0;
  color: var(--text-color-light);
  background: var(--bg-gradient-light);
  transition: all 0.3s ease;
}

.container {
  max-width: 400px;
  margin: 60px auto;
  background: var(--card-bg-light);
  border-radius: 18px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.07);
  padding: 40px 30px 30px 30px;
  text-align: center;
  transition: all 0.3s ease;
}

.logo {
  font-size: 2em;
  font-weight: bold;
  color: var(--accent-light);
  margin-bottom: 18px;
  letter-spacing: 1.5px;
}

.tabs {
  display: flex;
  justify-content: center;
  margin-bottom: 30px;
  gap: 10px;
}

.tab-btn {
  flex: 1;
  background: var(--field-bg-light);
  color: var(--accent-light);
  border: none;
  border-radius: 8px 8px 0 0;
  padding: 12px 0;
  font-size: 1.1em;
  font-weight: 500;
  cursor: pointer;
  transition: background 0.2s, color 0.2s;
}

.tab-btn.active {
  background: linear-gradient(135deg, var(--accent-light2) 80%, var(--accent-light) 100%);
  color: #fff;
}

form {
  display: none;
  margin-top: 10px;
  text-align: left;
}

form.active {
  display: block;
}

label {
  display: block;
  margin-bottom: 6px;
  color: var(--accent-light);
  font-weight: 500;
}

/* --- INPUT & CHAT BOX FIELDS --- */
input[type="text"],
input[type="email"],
input[type="password"],
input[type="number"],
textarea,
select {
  width: 100%;
  padding: 10px;
  margin-bottom: 18px;
  border-radius: 8px;
  border: 1.5px solid var(--border-color-light);
  background: var(--field-bg-light);
  font-size: 1em;
  color: var(--text-color-light);
  transition: border-color 0.2s, background 0.2s, color 0.2s;
  outline: none;
}

/* Focus states */
input:focus,
select:focus,
textarea:focus {
  border-color: var(--accent-light2);
  background: var(--field-bg-light-focus);
}

/* --- DARK MODE FIX for input/chat box --- */
@media (prefers-color-scheme: dark) {
  input[type="text"],
  input[type="email"],
  input[type="password"],
  input[type="number"],
  textarea,
  select {
    background: var(--field-bg-dark);
    border-color: var(--border-color-dark);
    color: var(--text-color-dark) !important;
    caret-color: var(--text-color-dark) !important;
  }

  input:focus,
  select:focus,
  textarea:focus {
    border-color: var(--accent-dark2);
    background: var(--field-bg-dark-focus);
    color: var(--text-color-dark) !important;
  }

  /* Placeholder text color in dark mode */
  input::placeholder,
  textarea::placeholder {
    color: #a7c8af;
    opacity: 0.8;
  }
}

/* --- BMI field visibility fix --- */
#bmi,
input[readonly],
input[disabled] {
  font-weight: 600;
  color: var(--text-color-light);
  background: var(--field-bg-light);
}

/* Dark mode readability for BMI field */
@media (prefers-color-scheme: dark) {
  #bmi,
  input[readonly],
  input[disabled] {
    color: #e8ffe8 !important;       /* bright green-white text */
    background: #253b29 !important;  /* slightly lighter dark background */
    font-weight: 600;
    border-color: var(--accent-dark2);
  }

  /* Highlight text selection inside BMI box */
  #bmi::selection {
    background: var(--accent-dark2);
    color: #0f1c12;
  }
}

.submit-btn {
  width: 100%;
  background: linear-gradient(135deg, var(--accent-light2) 80%, var(--accent-light) 100%);
  color: #fff;
  border: none;
  border-radius: 8px;
  padding: 12px 0;
  font-size: 1.1em;
  font-weight: 500;
  cursor: pointer;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.10);
  transition: background 0.2s, transform 0.2s;
}

.submit-btn:hover {
  background: linear-gradient(135deg, var(--accent-light) 80%, var(--accent-light2) 100%);
  transform: scale(1.03);
}

.link {
  display: block;
  margin-top: 18px;
  color: var(--accent-light);
  text-decoration: none;
  font-size: 0.98em;
  transition: color 0.2s;
  text-align: center;
}

.link:hover {
  color: var(--accent-light2);
}

/* --- DARK MODE GENERAL --- */
@media (prefers-color-scheme: dark) {
  body {
    background: var(--bg-gradient-dark);
    color: var(--text-color-dark);
  }

  .container {
    background: var(--card-bg-dark);
    box-shadow: 0 4px 24px rgba(0, 0, 0, 0.25);
  }

  .logo {
    color: var(--accent-dark2);
  }

  .tab-btn {
    background: var(--field-bg-dark);
    color: var(--accent-dark2);
  }

  .tab-btn.active {
    background: linear-gradient(135deg, var(--accent-dark2) 80%, var(--accent-dark) 100%);
    color: #fff;
  }

  label {
    color: var(--accent-dark2);
  }

  .submit-btn {
    background: linear-gradient(135deg, var(--accent-dark2) 80%, var(--accent-dark) 100%);
  }

  .submit-btn:hover {
    background: linear-gradient(135deg, var(--accent-dark) 80%, var(--accent-dark2) 100%);
  }

  .link {
    color: var(--accent-dark2);
  }

  .link:hover {
    color: var(--accent-dark);
  }
}

/* --- MOBILE --- */
@media (max-width: 500px) {
  .container {
    padding: 18px 6px 18px 6px;
  }

  .logo {
    font-size: 1.3em;
  }
}




  </style>
</head>
<body>
  <div class="container">
    <div class="logo">Calorie Calculator</div>
    <div class="tabs">
      <button class="tab-btn active" onclick="showTab('login')">Login</button>
      <button class="tab-btn" onclick="showTab('signup')">Sign Up</button>
    </div>

    <!-- Login Form -->
    <form id="loginForm" class="active" autocomplete="off">
      <label for="loginEmail">Email</label>
      <input type="email" id="loginEmail" name="loginEmail" required>
      <label for="loginPassword">Password</label>
      <input type="password" id="loginPassword" name="loginPassword" required>
      <button type="submit" class="submit-btn">Login</button>
      <a href="#" class="link">Forgot password?</a>
    </form>

    <!-- Signup Form -->
    <form id="signupForm" autocomplete="off">
      <label for="signupName">Name</label>
      <input type="text" id="signupName" name="signupName" required>
      <label for="signupEmail">Email</label>
      <input type="email" id="signupEmail" name="signupEmail" required>
      <label for="signupPassword">Password</label>
      <input type="password" id="signupPassword" name="signupPassword" required>
      <label for="signupAge">Age</label>
      <input type="number" id="signupAge" name="signupAge" min="1" required>
      <label for="signupHeight">Height (cm)</label>
      <input type="number" id="signupHeight" name="signupHeight" min="1" required>
      <label for="signupWeight">Weight (kg)</label>
      <input type="number" id="signupWeight" name="signupWeight" min="1" required>
      <label for="signupGoal">Goal</label>
      <select id="signupGoal" name="signupGoal" required>
        <option value="">Select your goal</option>
        <option value="Lose Weight">Lose Weight</option>
        <option value="Maintain Weight">Maintain Weight</option>
        <option value="Gain Weight">Gain Weight</option>
        <option value="Build Muscle">Build Muscle</option>
        <option value="Improve Health">Improve Health</option>
      </select>
      <label for="signupBMI">BMI</label>
      <input type="text" id="signupBMI" name="signupBMI" readonly style="background:#e3f0ff;">
      <button type="submit" class="submit-btn">Sign Up</button>
    </form>

    <a href="Homepage.html" class="link">&larr; Back to Homepage</a>
  </div>

  <script>
    function showTab(tab) {
      document.getElementById('loginForm').classList.remove('active');
      document.getElementById('signupForm').classList.remove('active');
      document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
      if(tab === 'login') {
        document.getElementById('loginForm').classList.add('active');
        document.querySelectorAll('.tab-btn')[0].classList.add('active');
      } else {
        document.getElementById('signupForm').classList.add('active');
        document.querySelectorAll('.tab-btn')[1].classList.add('active');
      }
    }

    document.getElementById('loginForm').onsubmit = function(e) {
      e.preventDefault();
      alert('Login successful!\\nWelcome back, ' + document.getElementById('loginEmail').value + '!');
      window.location.href = "Homepage.html";
    };

    document.getElementById('signupForm').onsubmit = function(e) {
      e.preventDefault();
      alert(
        'Sign up successful!\\n' +
        'Welcome, ' + document.getElementById('signupName').value + '!\\n' +
        'Age: ' + document.getElementById('signupAge').value + '\\n' +
        'Height: ' + document.getElementById('signupHeight').value + ' cm\\n' +
        'Weight: ' + document.getElementById('signupWeight').value + ' kg\\n' +
        'Goal: ' + document.getElementById('signupGoal').value + '\\n' +
        'BMI: ' + document.getElementById('signupBMI').value
      );
      window.location.href = "Homepage.html";
    };

    document.getElementById('signupHeight').addEventListener('input', updateBMI);
    document.getElementById('signupWeight').addEventListener('input', updateBMI);

    function updateBMI() {
      const heightCm = parseFloat(document.getElementById('signupHeight').value);
      const weightKg = parseFloat(document.getElementById('signupWeight').value);
      if(heightCm > 0 && weightKg > 0) {
        const heightM = heightCm / 100;
        const bmi = (weightKg / (heightM * heightM)).toFixed(1);
        document.getElementById('signupBMI').value = bmi;
      } else {
        document.getElementById('signupBMI').value = '';
      }
    }
  </script>
</body>
</html>
