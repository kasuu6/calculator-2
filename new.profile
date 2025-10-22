<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile</title>
  <style>
    :root {
      /* Light Mode */
      --light-bg: #fff6e5;             
      --light-card: #ffffff;            
      --light-text: #4caf50;            
      --light-button: #4caf50;          
      --light-button-hover: #43a047;    
      --accent: #4caf50;                
      --blur: 12px;
      --transition: 0.8s ease;

      /* Dark Mode */
      --dark-bg: #1b1b1b;
      --dark-card: rgba(36, 36, 36, 0.8);
      --dark-text: #f5f5f5;
      --dark-button: #81c784;
      --dark-button-hover: #66bb6a;
    }

    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      margin: 0;
      padding: 0;
      background: var(--light-bg);
      color: var(--light-text);
      overflow-x: hidden;
      transition: background var(--transition), color var(--transition);
    }

    body.dark {
      background: var(--dark-bg);
      color: var(--dark-text);
    }

    .profile-container {
      max-width: 450px;
      margin: 5% auto;
      padding: 2.5rem;
      border-radius: 20px;
      background: var(--light-card);
      backdrop-filter: blur(var(--blur));
      box-shadow: 0 12px 24px rgba(76, 175, 80, 0.15);
      transition: background var(--transition), transform var(--transition), opacity var(--transition);
      opacity: 0;
      transform: translateY(30px);
      text-align: center;
    }

    body.dark .profile-container {
      background: var(--dark-card);
      box-shadow: 0 8px 32px rgba(0,0,0,0.2);
    }

    .profile-container.show {
      opacity: 1;
      transform: translateY(0);
    }

    h1, p { text-align: center; margin-bottom: 1rem; }
    p { line-height: 1.5; }

    .profile-avatar {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      border: 4px solid var(--accent);
      margin: 0 auto 20px auto;
      box-shadow: 0 2px 8px rgba(0,0,0,0.3);
      transition: border var(--transition);
      display: block;
    }

    .profile-name {
      font-size: 2em;
      font-weight: bold;
      margin-bottom: 10px;
      color: var(--accent);
      transition: color var(--transition);
    }

    .profile-info,
    .profile-details,
    .section-box {
      background: #fefefe;
      border-radius: 12px;
      padding: 18px;
      margin-bottom: 10px;
      text-align: left;
      border: 1px solid rgba(76, 175, 80, 0.25);
      box-shadow: 0 4px 12px rgba(76, 175, 80, 0.1);
      backdrop-filter: blur(8px);
      transition: all 0.4s ease;
      color: var(--light-text);
    }

    body.dark .profile-info,
    body.dark .profile-details,
    body.dark .section-box {
      background: rgba(36, 36, 36, 0.8);
      border-color: rgba(255, 255, 255, 0.2);
      box-shadow: 0 2px 6px rgba(0,0,0,0.08);
      color: var(--dark-text);
    }

    strong, h3 { color: var(--accent); }
    body.dark strong, body.dark h3 { color: var(--accent); }

    .btn, button {
      display: inline-block;
      padding: 0.7rem 1.5rem;
      border: none;
      border-radius: 12px;
      cursor: pointer;
      font-weight: bold;
      text-align: center;
      color: #fff;
      background: var(--light-button);
      transition: all 0.3s ease;
      margin: 10px auto;
      box-shadow: none;
    }

    .btn:hover, button:hover {
      background: var(--light-button-hover);
      transform: translateY(-2px);
      box-shadow: none;
    }

    body.dark .btn, body.dark button {
      background: var(--dark-button);
      box-shadow: none;
    }

    body.dark .btn:hover, body.dark button:hover {
      background: var(--dark-button-hover);
      transform: translateY(-2px);
      box-shadow: none;
    }

    .fade-out { opacity: 0; transform: translateY(30px); }
  </style>
</head>
<body>
  <!-- Back button fixed at top-left -->
  <button class="btn" id="backBtn" style="
      position: fixed;
      top: 20px;
      left: 20px;
      z-index: 1000;
      margin: 0;
      padding: 0.6rem 1.2rem;
      border-radius: 12px;
  ">Back to Calculator</button>

  <!-- Profile Container -->
  <div class="profile-container" id="profile">
    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="User Avatar" class="profile-avatar">
    <div class="profile-name">John Doe</div>
    <div class="profile-info">Goal: <strong>Lose Weight</strong></div>

    <div class="profile-details">
      <div><strong>Age:</strong> 28</div>
      <div><strong>Height:</strong> 175 cm</div>
      <div><strong>Weight:</strong> 72 kg</div>
      <div><strong>BMI:</strong> <span id="bmi-value"></span></div>
    </div>

    <div class="section-box">
      <h3>Today's Meal Plan</h3>
      <select id="daySelector">
        <option value="0">Sunday</option>
        <option value="1">Monday</option>
        <option value="2">Tuesday</option>
        <option value="3">Wednesday</option>
        <option value="4">Thursday</option>
        <option value="5">Friday</option>
        <option value="6">Saturday</option>
      </select>
      <div id="meal-plan"></div>
    </div>

    <div class="section-box">
      <h3>Progress Tracker</h3>
      <div id="calendar"></div>
      <div id="progress-info" style="margin-top:12px;"></div>
    </div>

    <div class="section-box">
      <h3 style="text-align:center;">AI Chatbot</h3>
      <div id="chatbot-window" style="height:220px; overflow-y:auto; border-radius:8px; border:1px solid rgba(255,255,255,0.2); padding:10px; margin-bottom:15px;"></div>
      <div style="text-align:center;">
        <input id="chatbot-input" type="text" placeholder="Ask me about your meal plan, calories, BMI..." style="width:80%; max-width:400px; height:40px; font-size:1em; text-align:left; padding:8px; border-radius:8px; border:1px solid rgba(0,0,0,0.2); margin-bottom:10px;">
        <br>
        <button onclick="sendChatbotMessage()" style="width:120px; height:40px; font-size:1em; margin-top:5px;">Send</button>
      </div>
    </div>
  </div>

  <script>
    // Apply theme from localStorage (set on homepage)
    if(localStorage.getItem('theme') === 'dark') document.body.classList.add('dark');

    // Show profile with animation
    const profile = document.getElementById('profile');
    window.addEventListener('DOMContentLoaded', () => setTimeout(() => profile.classList.add('show'), 100));

    // Back button
    document.getElementById('backBtn').addEventListener('click', () => {
      profile.classList.add('fade-out');
      setTimeout(() => window.location.href = 'calcu.html', 800);
    });

    // BMI
    const heightCm = 175, weightKg = 72;
    document.getElementById('bmi-value').textContent = (weightKg/((heightCm/100)**2)).toFixed(1);

    // Meal Plan
    const weeklyMealPlans = [
      {breakfast:"Oatmeal with Banana", lunch:"Grilled Chicken Salad", dinner:"Salmon, Rice & Veggies", total:950},
      {breakfast:"Greek Yogurt & Berries", lunch:"Turkey Sandwich", dinner:"Stir-fried Tofu & Vegetables", total:1000},
      {breakfast:"Scrambled Eggs & Toast", lunch:"Quinoa Salad", dinner:"Baked Cod & Sweet Potato", total:1010},
      {breakfast:"Fruit Smoothie", lunch:"Chicken Wrap", dinner:"Vegetable Pasta", total:970},
      {breakfast:"Peanut Butter Toast", lunch:"Lentil Soup & Bread", dinner:"Grilled Shrimp & Rice", total:960},
      {breakfast:"Omelette & Tomato", lunch:"Tuna Salad", dinner:"Chicken Curry & Rice", total:1010},
      {breakfast:"Cottage Cheese & Pineapple", lunch:"Veggie Burger", dinner:"Beef Stew & Potato", total:990}
    ];
    const daySelector = document.getElementById('daySelector');
    function showMealPlan(idx){
      const plan = weeklyMealPlans[idx];
      document.getElementById('meal-plan').innerHTML =
        `<b>Breakfast:</b> ${plan.breakfast}<br><b>Lunch:</b> ${plan.lunch}<br><b>Dinner:</b> ${plan.dinner}<br><i>Total: ~${plan.total} kcal</i>`;
    }
    daySelector.selectedIndex = new Date().getDay();
    showMealPlan(daySelector.selectedIndex);
    daySelector.addEventListener('change', () => showMealPlan(daySelector.value));

    // Progress Tracker
    function renderCalendar() {
      const today = new Date(), days = [];
      for(let i=0;i<7;i++){ const d = new Date(today); d.setDate(today.getDate()-today.getDay()+i); days.push(d);}
      let html = '<table style="width:100%; text-align:center;"><tr>';
      days.forEach(d => html += `<th>${d.toLocaleDateString(undefined,{weekday:'short'})}</th>`);
      html += '</tr><tr>';
      days.forEach(d => html += `<td><input type="checkbox" id="day${d.getDay()}" /></td>`);
      html += '</tr></table>';
      document.getElementById('calendar').innerHTML = html;
    }
    function updateProgress() {
      let checked = 0; for(let i=0;i<7;i++) if(document.getElementById('day'+i).checked) checked++;
      document.getElementById('progress-info').textContent = `You followed your meal plan ${checked} out of 7 days this week!`;
    }
    renderCalendar(); for(let i=0;i<7;i++) document.getElementById('day'+i).addEventListener('change',updateProgress);

    // Chatbot
    function sendChatbotMessage(){
      const input = document.getElementById('chatbot-input'),
            win = document.getElementById('chatbot-window'),
            msg = input.value.trim();
      if(!msg) return;
      win.innerHTML += `<div><b>You:</b> ${msg}</div>`; input.value='';
      let resp = "Ask me about your meal plan, calories, or BMI!";
      if(/bmi/i.test(msg)) resp = `Your BMI is <b>${(weightKg/((heightCm/100)**2)).toFixed(1)}</b>.`;
      else if(/calorie/i.test(msg)) resp = "Your daily plan is around 950–1010 kcal.";
      else if(/hello|hi|hey/i.test(msg)) resp = "Hello! How can I help?";
      win.innerHTML += `<div style="color:${getComputedStyle(document.documentElement).getPropertyValue('--accent')};"><b>AI:</b> ${resp}</div>`;
      win.scrollTop = win.scrollHeight;
    }
  </script>
</body>
</html>
